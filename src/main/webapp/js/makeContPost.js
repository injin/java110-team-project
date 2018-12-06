function makeContHtml(cont, index) {
    var text = cont.replace(/[\s]+/g, " ").trim();
    var word = text.split(' ');
    var newHTML = "";
    word.forEach(function(value, index) {
        var str = "";
        var endBr = value.endsWith('<br>');
        var valueArr = [ value ];
        if (value.includes('<br>')) {
            valueArr = value.split('<br>');
            str = "<br>";
        }
        valueArr.forEach(function(value2, index) {
            if (index == (valueArr.length - 1)
                    && endBr == false) {
                str = " ";
            }
            if (value2.startsWith("#")) {
                newHTML += ("<span class='hash'><a href='/app/searchResult?keyword="
                        + value2.substring(1)
                        + "'>"
                        + value2 + "&nbsp;</a></span>" + str);
            } else {
                newHTML +=  (value2+ str);
            }
        });
    });
    return newHTML;
}

function showCont(cont, index) {
    var newHTML = makeContHtml(cont, index);
    document.getElementById('reviewCont-' + index).innerHTML = newHTML;
}