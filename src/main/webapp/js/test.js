defaults._set('pie', helpers.clone(defaults.doughnut));
defaults._set('pie', {
    cutoutPercentage: 0
});

module.exports = function(Chart) {

    Chart.controllers.doughnut = Chart.controllers.pie = Chart.DatasetController.extend({

        dataElementType: elements.Arc,

        linkScales: helpers.noop,

        // Get index of the dataset in relation to the visible datasets. This allows determining the inner and outer radius correctly
        getRingIndex: function(datasetIndex) {
            var ringIndex = 0;

            for (var j = 0; j < datasetIndex; ++j) {
                if (this.chart.isDatasetVisible(j)) {
                    ++ringIndex;
                }
            }

            return ringIndex;
        },

        update: function(reset) {
            var me = this;
            var chart = me.chart;
            var chartArea = chart.chartArea;
            var opts = chart.options;
            var arcOpts = opts.elements.arc;
            var availableWidth = chartArea.right - chartArea.left - arcOpts.borderWidth;
            var availableHeight = chartArea.bottom - chartArea.top - arcOpts.borderWidth;
            var minSize = Math.min(availableWidth, availableHeight);
            var offset = {x: 0, y: 0};
            var meta = me.getMeta();
            var cutoutPercentage = opts.cutoutPercentage;
            var circumference = opts.circumference;

            // If the chart's circumference isn't a full circle, calculate minSize as a ratio of the width/height of the arc
            if (circumference < Math.PI * 2.0) {
                var startAngle = opts.rotation % (Math.PI * 2.0);
                startAngle += Math.PI * 2.0 * (startAngle >= Math.PI ? -1 : startAngle < -Math.PI ? 1 : 0);
                var endAngle = startAngle + circumference;
                var start = {x: Math.cos(startAngle), y: Math.sin(startAngle)};
                var end = {x: Math.cos(endAngle), y: Math.sin(endAngle)};
                var contains0 = (startAngle <= 0 && endAngle >= 0) || (startAngle <= Math.PI * 2.0 && Math.PI * 2.0 <= endAngle);
                var contains90 = (startAngle <= Math.PI * 0.5 && Math.PI * 0.5 <= endAngle) || (startAngle <= Math.PI * 2.5 && Math.PI * 2.5 <= endAngle);
                var contains180 = (startAngle <= -Math.PI && -Math.PI <= endAngle) || (startAngle <= Math.PI && Math.PI <= endAngle);
                var contains270 = (startAngle <= -Math.PI * 0.5 && -Math.PI * 0.5 <= endAngle) || (startAngle <= Math.PI * 1.5 && Math.PI * 1.5 <= endAngle);
                var cutout = cutoutPercentage / 100.0;
                var min = {x: contains180 ? -1 : Math.min(start.x * (start.x < 0 ? 1 : cutout), end.x * (end.x < 0 ? 1 : cutout)), y: contains270 ? -1 : Math.min(start.y * (start.y < 0 ? 1 : cutout), end.y * (end.y < 0 ? 1 : cutout))};
                var max = {x: contains0 ? 1 : Math.max(start.x * (start.x > 0 ? 1 : cutout), end.x * (end.x > 0 ? 1 : cutout)), y: contains90 ? 1 : Math.max(start.y * (start.y > 0 ? 1 : cutout), end.y * (end.y > 0 ? 1 : cutout))};
                var size = {width: (max.x - min.x) * 0.5, height: (max.y - min.y) * 0.5};
                minSize = Math.min(availableWidth / size.width, availableHeight / size.height);
                offset = {x: (max.x + min.x) * -0.5, y: (max.y + min.y) * -0.5};
            }

            chart.borderWidth = me.getMaxBorderWidth(meta.data);
            chart.outerRadius = Math.max((minSize - chart.borderWidth) / 2, 0);
            chart.innerRadius = Math.max(cutoutPercentage ? (chart.outerRadius / 100) * (cutoutPercentage) : 0, 0);
            chart.radiusLength = (chart.outerRadius - chart.innerRadius) / chart.getVisibleDatasetCount();
            chart.offsetX = offset.x * chart.outerRadius;
            chart.offsetY = offset.y * chart.outerRadius;

            meta.total = me.calculateTotal();

            me.outerRadius = chart.outerRadius - (chart.radiusLength * me.getRingIndex(me.index));
            me.innerRadius = Math.max(me.outerRadius - chart.radiusLength, 0);

            helpers.each(meta.data, function(arc, index) {
                me.updateElement(arc, index, reset);
            });
        },

        updateElement: function(arc, index, reset) {
            var me = this;
            var chart = me.chart;
            var chartArea = chart.chartArea;
            var opts = chart.options;
            var animationOpts = opts.animation;
            var centerX = (chartArea.left + chartArea.right) / 2;
            var centerY = (chartArea.top + chartArea.bottom) / 2;
            var startAngle = opts.rotation; // non reset case handled later
            var endAngle = opts.rotation; // non reset case handled later
            var dataset = me.getDataset();
            var circumference = reset && animationOpts.animateRotate ? 0 : arc.hidden ? 0 : me.calculateCircumference(dataset.data[index]) * (opts.circumference / (2.0 * Math.PI));
            var innerRadius = reset && animationOpts.animateScale ? 0 : me.innerRadius;
            var outerRadius = reset && animationOpts.animateScale ? 0 : me.outerRadius;
            var valueAtIndexOrDefault = helpers.valueAtIndexOrDefault;

            helpers.extend(arc, {
                // Utility
                _datasetIndex: me.index,
                _index: index,

                // Desired view properties
                _model: {
                    x: centerX + chart.offsetX,
                    y: centerY + chart.offsetY,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    circumference: circumference,
                    outerRadius: outerRadius,
                    innerRadius: innerRadius,
                    label: valueAtIndexOrDefault(dataset.label, index, chart.data.labels[index])
                }
            });

            var model = arc._model;

            // Resets the visual styles
            var custom = arc.custom || {};
            var valueOrDefault = helpers.valueAtIndexOrDefault;
            var elementOpts = this.chart.options.elements.arc;
            model.backgroundColor = custom.backgroundColor ? custom.backgroundColor : valueOrDefault(dataset.backgroundColor, index, elementOpts.backgroundColor);
            model.borderColor = custom.borderColor ? custom.borderColor : valueOrDefault(dataset.borderColor, index, elementOpts.borderColor);
            model.borderWidth = custom.borderWidth ? custom.borderWidth : valueOrDefault(dataset.borderWidth, index, elementOpts.borderWidth);

            // Set correct angles if not resetting
            if (!reset || !animationOpts.animateRotate) {
                if (index === 0) {
                    model.startAngle = opts.rotation;
                } else {
                    model.startAngle = me.getMeta().data[index - 1]._model.endAngle;
                }

                model.endAngle = model.startAngle + model.circumference;
            }

            arc.pivot();
        },

        calculateTotal: function() {
            var dataset = this.getDataset();
            var meta = this.getMeta();
            var total = 0;
            var value;

            helpers.each(meta.data, function(element, index) {
                value = dataset.data[index];
                if (!isNaN(value) && !element.hidden) {
                    total += Math.abs(value);
                }
            });

            /* if (total === 0) {
                total = NaN;
            }*/

            return total;
        },

        calculateCircumference: function(value) {
            var total = this.getMeta().total;
            if (total > 0 && !isNaN(value)) {
                return (Math.PI * 2.0) * (Math.abs(value) / total);
            }
            return 0;
        },

        // gets the max border or hover width to properly scale pie charts
        getMaxBorderWidth: function(arcs) {
            var max = 0;
            var index = this.index;
            var length = arcs.length;
            var borderWidth;
            var hoverWidth;

            for (var i = 0; i < length; i++) {
                borderWidth = arcs[i]._model ? arcs[i]._model.borderWidth : 0;
                hoverWidth = arcs[i]._chart ? arcs[i]._chart.config.data.datasets[index].hoverBorderWidth : 0;

                max = borderWidth > max ? borderWidth : max;
                max = hoverWidth > max ? hoverWidth : max;
            }
            return max;
        }
    });
};
