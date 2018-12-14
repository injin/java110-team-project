INSERT INTO mv_gr(grno, gr_nm) VALUES(28,'액션');
INSERT INTO mv_gr(grno, gr_nm) VALUES(12,'모험');
INSERT INTO mv_gr(grno, gr_nm) VALUES(16,'애니');
INSERT INTO mv_gr(grno, gr_nm) VALUES(35,'코미디');
INSERT INTO mv_gr(grno, gr_nm) VALUES(80,'범죄');
INSERT INTO mv_gr(grno, gr_nm) VALUES(99,'다큐');
INSERT INTO mv_gr(grno, gr_nm) VALUES(18,'드라마');
INSERT INTO mv_gr(grno, gr_nm) VALUES(10751,'가족');
INSERT INTO mv_gr(grno, gr_nm) VALUES(14,'판타지');
INSERT INTO mv_gr(grno, gr_nm) VALUES(36,'역사');
INSERT INTO mv_gr(grno, gr_nm) VALUES(27,'공포');
INSERT INTO mv_gr(grno, gr_nm) VALUES(10402,'음악');
INSERT INTO mv_gr(grno, gr_nm) VALUES(9648,'추리');
INSERT INTO mv_gr(grno, gr_nm) VALUES(10749,'로맨스');
INSERT INTO mv_gr(grno, gr_nm) VALUES(878,'SF');
INSERT INTO mv_gr(grno, gr_nm) VALUES(10770,'TV');
INSERT INTO mv_gr(grno, gr_nm) VALUES(53,'스릴러');
INSERT INTO mv_gr(grno, gr_nm) VALUES(10752,'전쟁');
INSERT INTO mv_gr(grno, gr_nm) VALUES(37,'서부극');


INSERT INTO mv_mv (mvno, titl) VALUES(0, '');


START TRANSACTION;
INSERT INTO mv_post_type (ptno, `type`) VALUES(0, 'mp');
INSERT INTO mv_post_type (ptno, `type`) VALUES(1, 'dp');
INSERT INTO mv_post_type (ptno, `type`) VALUES(3, 'sr');
INSERT INTO mv_post_type (ptno, `type`) VALUES(4, 'pc');
INSERT INTO mv_post_type (ptno, `type`) VALUES(5, 'sc');
INSERT INTO mv_post_type (ptno, `type`) VALUES(6, 'fr');


INSERT INTO `mv_memb`(`admin`, `mid`, `nick`) VALUES ('N', '000000000', 'UNKNOWN');

COMMIT;




