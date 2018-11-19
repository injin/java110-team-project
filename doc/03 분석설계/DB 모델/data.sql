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
INSERT INTO mv_mv (mvno, titl) VALUES(637, '인생은 아름다워');
INSERT INTO mv_mv (mvno, titl) VALUES(9873, '에프 엑스');
INSERT INTO mv_mv (mvno, titl) VALUES(13492, '프런티어');
INSERT INTO mv_mv (mvno, titl) VALUES(15775, '이프 온리');
INSERT INTO mv_mv (mvno, titl) VALUES(59053, '라 리파');
INSERT INTO mv_mv (mvno, titl) VALUES(130739, '커피 인 베를린');
INSERT INTO mv_mv (mvno, titl) VALUES(157336, '인터스텔라');
INSERT INTO mv_mv (mvno, titl) VALUES(160704, '베를린');
INSERT INTO mv_mv (mvno, titl) VALUES(315439, '사도');
INSERT INTO mv_mv (mvno, titl) VALUES(320302, '달에 가 본적이 있나요');
INSERT INTO mv_mv (mvno, titl) VALUES(424694, '보헤미안 랩소디');
INSERT INTO mv_mv (mvno, titl) VALUES(506943, '라라랜드');
INSERT INTO mv_mv (mvno, titl) VALUES(535389, '안시성');
INSERT INTO mv_mv (mvno, titl) VALUES(559994, 'Watch If You Dare');


START TRANSACTION;
INSERT INTO mv_post_type (ptno, `type`) VALUES(0, 'mp');
INSERT INTO mv_post_type (ptno, `type`) VALUES(1, 'dp');
INSERT INTO mv_post_type (ptno, `type`) VALUES(3, 'sr');
INSERT INTO mv_post_type (ptno, `type`) VALUES(4, 'pc');
INSERT INTO mv_post_type (ptno, `type`) VALUES(5, 'sc');
INSERT INTO mv_post_type (ptno, `type`) VALUES(6, 'fr');
COMMIT;




