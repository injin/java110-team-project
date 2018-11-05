-- 회원
DROP TABLE IF EXISTS mv_memb RESTRICT;

-- 게시물
DROP TABLE IF EXISTS mv_post RESTRICT;

-- 게시물댓글
DROP TABLE IF EXISTS mv_post_cmt RESTRICT;

-- 영화분석
DROP TABLE IF EXISTS mv_mv_anly RESTRICT;

-- 관리자추천테마
DROP TABLE IF EXISTS mv_thm RESTRICT;

-- 로그
DROP TABLE IF EXISTS mv_log RESTRICT;

-- 장면앨범
DROP TABLE IF EXISTS mv_lbm RESTRICT;

-- 장면리뷰
DROP TABLE IF EXISTS mv_sr RESTRICT;

-- 장면리뷰_댓글
DROP TABLE IF EXISTS mv_sr_cmt RESTRICT;

-- 장면리뷰_댓글지도
DROP TABLE IF EXISTS mv_sr_map RESTRICT;

-- 신고
DROP TABLE IF EXISTS mv_rpt RESTRICT;

-- 장르분석
DROP TABLE IF EXISTS mv_gr_anly RESTRICT;

-- 장르
DROP TABLE IF EXISTS mv_gr RESTRICT;

-- 팔로우
DROP TABLE IF EXISTS mv_flw RESTRICT;

-- 게시물친구태그
DROP TABLE IF EXISTS mv_frd_tag RESTRICT;

-- 장면리뷰_해시태그
DROP TABLE IF EXISTS mv_sr_tag RESTRICT;

-- 추천영화
DROP TABLE IF EXISTS mv_rcmd RESTRICT;

-- 영화
DROP TABLE IF EXISTS mv_mv RESTRICT;

-- 장면리뷰_앨범참조
DROP TABLE IF EXISTS mv_lbm_sr RESTRICT;

-- 게시물_사진
DROP TABLE IF EXISTS mv_post_phot RESTRICT;

-- 로그 읽음 테이블
DROP TABLE IF EXISTS mv_chk_log RESTRICT;

-- 게시물유형
DROP TABLE IF EXISTS mv_post_type RESTRICT;

-- 게시물_해시태그
DROP TABLE IF EXISTS mv_post_tag RESTRICT;

-- 회원선호장르
DROP TABLE IF EXISTS mv_memb_gr RESTRICT;

-- 신고 유형
DROP TABLE IF EXISTS mv_rpt_type RESTRICT;

-- 영화장르
DROP TABLE IF EXISTS mv_mv_gr RESTRICT;

-- 회원
CREATE TABLE mv_memb (
    mno    INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    admin  CHAR(1)      NOT NULL COMMENT '관리자여부', -- 관리자여부
    mid    VARCHAR(50)  NOT NULL COMMENT '아이디', -- 아이디
    nick   VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
    p_phot VARCHAR(255) NULL     COMMENT '프로필사진', -- 프로필사진
    c_phot VARCHAR(255) NULL     COMMENT '커버사진', -- 커버사진
    pr     TEXT         NULL     COMMENT '자기소개', -- 자기소개
    gend   VARCHAR(1)   NULL     COMMENT '셩별', -- 셩별
    age    VARCHAR(60)  NULL     COMMENT '연령대' -- 연령대
)
COMMENT '회원';

-- 회원
ALTER TABLE mv_memb
    ADD CONSTRAINT PK_mv_memb -- 회원 기본키
        PRIMARY KEY (
            mno -- 회원번호
        );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_mv_memb
    ON mv_memb ( -- 회원
        mid ASC -- 아이디
    );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_mv_memb2
    ON mv_memb ( -- 회원
        p_phot ASC -- 프로필사진
    );

-- 회원 유니크 인덱스3
CREATE UNIQUE INDEX UIX_mv_memb3
    ON mv_memb ( -- 회원
        c_phot ASC -- 커버사진
    );

-- 회원 인덱스
CREATE INDEX IX_mv_memb
    ON mv_memb( -- 회원
        nick ASC -- 닉네임
    );

ALTER TABLE mv_memb
    MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 게시물
CREATE TABLE mv_post (
    pstno INTEGER  NOT NULL COMMENT '게시물번호', -- 게시물번호
    mno   INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
    ptno  INTEGER  NOT NULL COMMENT '게시물타입번호', -- 게시물타입번호
    mvno  INTEGER  NULL     COMMENT '영화번호', -- 영화번호
    cdt   DATETIME NOT NULL COMMENT '생성일자', -- 생성일자
    mdt   DATETIME NULL     COMMENT '수정일자', -- 수정일자
    cont  TEXT     NULL     COMMENT '내용', -- 내용
    like  INTEGER  NULL     COMMENT '좋아요', -- 좋아요
    star  INTEGER  NULL     COMMENT '별점', -- 별점
    opn   CHAR(1)  NOT NULL COMMENT '공개여부' -- 공개여부
)
COMMENT '게시물';

-- 게시물
ALTER TABLE mv_post
    ADD CONSTRAINT PK_mv_post -- 게시물 기본키
        PRIMARY KEY (
            pstno -- 게시물번호
        );

ALTER TABLE mv_post
    MODIFY COLUMN pstno INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시물번호';

-- 게시물댓글
CREATE TABLE mv_post_cmt (
    pcno  INTEGER  NOT NULL COMMENT '댓글번호', -- 댓글번호
    pstno INTEGER  NOT NULL COMMENT '게시물번호', -- 게시물번호
    mno   INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
    cont  TEXT     NOT NULL COMMENT '내용', -- 내용
    cdt   DATETIME NOT NULL COMMENT '생성일자', -- 생성일자
    mdt   DATETIME NULL     COMMENT '수정일자' -- 수정일자
)
COMMENT '게시물댓글';

-- 게시물댓글
ALTER TABLE mv_post_cmt
    ADD CONSTRAINT PK_mv_post_cmt -- 게시물댓글 기본키
        PRIMARY KEY (
            pcno -- 댓글번호
        );

ALTER TABLE mv_post_cmt
    MODIFY COLUMN pcno INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- 영화분석
CREATE TABLE mv_mv_anly (
    mno  INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
    mvno INTEGER NOT NULL COMMENT '영화번호', -- 영화번호
    cnt  INTEGER NULL     COMMENT '게시글수' -- 게시글수
)
COMMENT '영화분석';

-- 영화분석
ALTER TABLE mv_mv_anly
    ADD CONSTRAINT PK_mv_mv_anly -- 영화분석 기본키
        PRIMARY KEY (
            mno,  -- 회원번호
            mvno  -- 영화번호
        );

-- 관리자추천테마
CREATE TABLE mv_thm (
    thmno INTEGER     NOT NULL COMMENT '테마번호', -- 테마번호
    thm   VARCHAR(50) NOT NULL COMMENT '테마제목' -- 테마제목
)
COMMENT '관리자추천테마';

-- 관리자추천테마
ALTER TABLE mv_thm
    ADD CONSTRAINT PK_mv_thm -- 관리자추천테마 기본키
        PRIMARY KEY (
            thmno -- 테마번호
        );

-- 관리자추천테마 유니크 인덱스
CREATE UNIQUE INDEX UIX_mv_thm
    ON mv_thm ( -- 관리자추천테마
        thm ASC -- 테마제목
    );

ALTER TABLE mv_thm
    MODIFY COLUMN thmno INTEGER NOT NULL AUTO_INCREMENT COMMENT '테마번호';

-- 로그
CREATE TABLE mv_log (
    lgno INTEGER      NOT NULL COMMENT '로그번호', -- 로그번호
    mno  INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    do   VARCHAR(50)  NOT NULL COMMENT '직접대상', -- 직접대상
    io   VARCHAR(50)  NULL     COMMENT '간접대상', -- 간접대상
    act  VARCHAR(50)  NOT NULL COMMENT '행위', -- 행위
    url  VARCHAR(255) NOT NULL COMMENT 'URL', -- URL
    cdt  DATETIME     NOT NULL COMMENT '날짜' -- 날짜
)
COMMENT '로그';

-- 로그
ALTER TABLE mv_log
    ADD CONSTRAINT PK_mv_log -- 로그 기본키
        PRIMARY KEY (
            lgno -- 로그번호
        );

ALTER TABLE mv_log
    MODIFY COLUMN lgno INTEGER NOT NULL AUTO_INCREMENT COMMENT '로그번호';

-- 장면앨범
CREATE TABLE mv_lbm (
    lbmno  INTEGER      NOT NULL COMMENT '보관함번호', -- 보관함번호
    mno    INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    lbm_nm VARCHAR(50)  NULL     COMMENT '보관함이름', -- 보관함이름
    phot   VARCHAR(255) NULL     COMMENT '대표이미지', -- 대표이미지
    cdt    DATETIME     NULL     COMMENT '생성일자', -- 생성일자
    mdt    DATETIME     NULL     COMMENT '수정일자', -- 수정일자
    opn    CHAR(1)      NOT NULL COMMENT '공개여부' -- 공개여부
)
COMMENT '장면앨범';

-- 장면앨범
ALTER TABLE mv_lbm
    ADD CONSTRAINT PK_mv_lbm -- 장면앨범 기본키
        PRIMARY KEY (
            lbmno -- 보관함번호
        );

ALTER TABLE mv_lbm
    MODIFY COLUMN lbmno INTEGER NOT NULL AUTO_INCREMENT COMMENT '보관함번호';

-- 장면리뷰
CREATE TABLE mv_sr (
    srno INTEGER      NOT NULL COMMENT '장면번호', -- 장면번호
    mvno INTEGER      NULL     COMMENT '영화번호', -- 영화번호
    mno  INTEGER      NULL     COMMENT '회원번호', -- 회원번호
    titl VARCHAR(50)  NOT NULL COMMENT '장면제목', -- 장면제목
    time TIME         NOT NULL COMMENT '장면시간', -- 장면시간
    phot VARCHAR(255) NOT NULL COMMENT '장면사진', -- 장면사진
    cont TEXT         NULL     COMMENT '장면내용', -- 장면내용
    spo  CHAR(1)      NOT NULL COMMENT '스포일러여부', -- 스포일러여부
    cdt  DATETIME     NOT NULL COMMENT '생성일자', -- 생성일자
    like INTEGER      NULL     COMMENT '좋아요' -- 좋아요
)
COMMENT '장면리뷰';

-- 장면리뷰
ALTER TABLE mv_sr
    ADD CONSTRAINT PK_mv_sr -- 장면리뷰 기본키
        PRIMARY KEY (
            srno -- 장면번호
        );

ALTER TABLE mv_sr
    MODIFY COLUMN srno INTEGER NOT NULL AUTO_INCREMENT COMMENT '장면번호';

ALTER TABLE mv_sr
    AUTO_INCREMENT = 0;

-- 장면리뷰_댓글
CREATE TABLE mv_sr_cmt (
    cmno INTEGER      NOT NULL COMMENT '장면리뷰댓글번호', -- 장면리뷰댓글번호
    srno INTEGER      NOT NULL COMMENT '장면번호', -- 장면번호
    mno  INTEGER      NULL     COMMENT '회원번호', -- 회원번호
    phot VARCHAR(255) NULL     COMMENT '사진', -- 사진
    cont TEXT         NOT NULL COMMENT '내용' -- 내용
)
COMMENT '장면리뷰_댓글';

-- 장면리뷰_댓글
ALTER TABLE mv_sr_cmt
    ADD CONSTRAINT PK_mv_sr_cmt -- 장면리뷰_댓글 기본키
        PRIMARY KEY (
            cmno -- 장면리뷰댓글번호
        );

-- 장면리뷰_댓글 유니크 인덱스
CREATE UNIQUE INDEX UIX_mv_sr_cmt
    ON mv_sr_cmt ( -- 장면리뷰_댓글
        phot ASC -- 사진
    );

ALTER TABLE mv_sr_cmt
    MODIFY COLUMN cmno INTEGER NOT NULL AUTO_INCREMENT COMMENT '장면리뷰댓글번호';

-- 장면리뷰_댓글지도
CREATE TABLE mv_sr_map (
    mpno  INTEGER     NOT NULL COMMENT '지도번호', -- 지도번호
    cmno  INTEGER     NOT NULL COMMENT '장면리뷰댓글번호', -- 장면리뷰댓글번호
    mp_nm VARCHAR(50) NULL     COMMENT '장소이름', -- 장소이름
    lat   DOUBLE      NULL     COMMENT '위도', -- 위도
    lng   DOUBLE      NULL     COMMENT '경도' -- 경도
)
COMMENT '장면리뷰_댓글지도';

-- 장면리뷰_댓글지도
ALTER TABLE mv_sr_map
    ADD CONSTRAINT PK_mv_sr_map -- 장면리뷰_댓글지도 기본키
        PRIMARY KEY (
            mpno -- 지도번호
        );

ALTER TABLE mv_sr_map
    MODIFY COLUMN mpno INTEGER NOT NULL AUTO_INCREMENT COMMENT '지도번호';

-- 신고
CREATE TABLE mv_rpt (
    rptno INTEGER      NOT NULL COMMENT '신고번호', -- 신고번호
    mno   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    trgt  VARCHAR(50)  NULL     COMMENT '대상', -- 대상
    cont  TEXT         NOT NULL COMMENT '신고내용', -- 신고내용
    url   VARCHAR(255) NOT NULL COMMENT 'URL', -- URL
    hndl  CHAR(1)      NULL     COMMENT '처리여부', -- 처리여부
    cdt   DATETIME     NOT NULL COMMENT '신고일자' -- 신고일자
)
COMMENT '신고';

-- 신고
ALTER TABLE mv_rpt
    ADD CONSTRAINT PK_mv_rpt -- 신고 기본키
        PRIMARY KEY (
            rptno -- 신고번호
        );

ALTER TABLE mv_rpt
    MODIFY COLUMN rptno INTEGER NOT NULL AUTO_INCREMENT COMMENT '신고번호';

-- 장르분석
CREATE TABLE mv_gr_anly (
    mno  INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
    grno INTEGER NOT NULL COMMENT '장르번호', -- 장르번호
    cnt  INTEGER NULL     COMMENT '게시글수' -- 게시글수
)
COMMENT '장르분석';

-- 장르분석
ALTER TABLE mv_gr_anly
    ADD CONSTRAINT PK_mv_gr_anly -- 장르분석 기본키
        PRIMARY KEY (
            mno,  -- 회원번호
            grno  -- 장르번호
        );

-- 장르
CREATE TABLE mv_gr (
    grno  INTEGER     NOT NULL COMMENT '장르번호', -- 장르번호
    gr_nm VARCHAR(50) NOT NULL COMMENT '장르이름' -- 장르이름
)
COMMENT '장르';

-- 장르
ALTER TABLE mv_gr
    ADD CONSTRAINT PK_mv_gr -- 장르 기본키
        PRIMARY KEY (
            grno -- 장르번호
        );

-- 팔로우
CREATE TABLE mv_flw (
    mno INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
    flw INTEGER NOT NULL COMMENT '팔로우' -- 팔로우
)
COMMENT '팔로우';

-- 팔로우
ALTER TABLE mv_flw
    ADD CONSTRAINT PK_mv_flw -- 팔로우 기본키
        PRIMARY KEY (
            mno, -- 회원번호
            flw  -- 팔로우
        );

-- 게시물친구태그
CREATE TABLE mv_frd_tag (
    pstno INTEGER NOT NULL COMMENT '게시물번호', -- 게시물번호
    mno   INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '게시물친구태그';

-- 게시물친구태그
ALTER TABLE mv_frd_tag
    ADD CONSTRAINT PK_mv_frd_tag -- 게시물친구태그 기본키
        PRIMARY KEY (
            pstno, -- 게시물번호
            mno    -- 회원번호
        );

-- 장면리뷰_해시태그
CREATE TABLE mv_sr_tag (
    tagno INTEGER     NOT NULL COMMENT '해시태그번호', -- 해시태그번호
    cmno  INTEGER     NOT NULL COMMENT '장면리뷰댓글번호', -- 장면리뷰댓글번호
    cont  VARCHAR(50) NOT NULL COMMENT '태그내용' -- 태그내용
)
COMMENT '장면리뷰_해시태그';

-- 장면리뷰_해시태그
ALTER TABLE mv_sr_tag
    ADD CONSTRAINT PK_mv_sr_tag -- 장면리뷰_해시태그 기본키
        PRIMARY KEY (
            tagno -- 해시태그번호
        );

-- 장면리뷰_해시태그 인덱스
CREATE INDEX IX_mv_sr_tag
    ON mv_sr_tag( -- 장면리뷰_해시태그
        cont ASC -- 태그내용
    );

ALTER TABLE mv_sr_tag
    MODIFY COLUMN tagno INTEGER NOT NULL AUTO_INCREMENT COMMENT '해시태그번호';

-- 추천영화
CREATE TABLE mv_rcmd (
    thmno INTEGER NOT NULL COMMENT '테마번호', -- 테마번호
    mvno  INTEGER NOT NULL COMMENT '영화번호' -- 영화번호
)
COMMENT '추천영화';

-- 추천영화
ALTER TABLE mv_rcmd
    ADD CONSTRAINT PK_mv_rcmd -- 추천영화 기본키
        PRIMARY KEY (
            thmno, -- 테마번호
            mvno   -- 영화번호
        );

-- 추천영화 유니크 인덱스
CREATE UNIQUE INDEX UIX_mv_rcmd
    ON mv_rcmd ( -- 추천영화
        thmno ASC -- 테마번호
    );

-- 영화
CREATE TABLE mv_mv (
    mvno INTEGER     NOT NULL COMMENT '영화번호', -- 영화번호
    mvid VARCHAR(50) NOT NULL COMMENT '영화아이디', -- 영화아이디
    titl VARCHAR(50) NULL     COMMENT '영화제목' -- 영화제목
)
COMMENT '영화';

-- 영화
ALTER TABLE mv_mv
    ADD CONSTRAINT PK_mv_mv -- 영화 기본키
        PRIMARY KEY (
            mvno -- 영화번호
        );

-- 영화 유니크 인덱스
CREATE UNIQUE INDEX UIX_mv_mv
    ON mv_mv ( -- 영화
        mvid ASC -- 영화아이디
    );

-- 장면리뷰_앨범참조
CREATE TABLE mv_lbm_sr (
    lbmno INTEGER NOT NULL COMMENT '보관함번호', -- 보관함번호
    srno  INTEGER NOT NULL COMMENT '장면번호' -- 장면번호
)
COMMENT '장면리뷰_앨범참조';

-- 장면리뷰_앨범참조
ALTER TABLE mv_lbm_sr
    ADD CONSTRAINT PK_mv_lbm_sr -- 장면리뷰_앨범참조 기본키
        PRIMARY KEY (
            lbmno, -- 보관함번호
            srno   -- 장면번호
        );

-- 게시물_사진
CREATE TABLE mv_post_phot (
    pno   INTEGER      NOT NULL COMMENT '사진번호', -- 사진번호
    phot  VARCHAR(255) NOT NULL COMMENT '사진명', -- 사진명
    pstno INTEGER      NOT NULL COMMENT '게시물번호' -- 게시물번호
)
COMMENT '게시물_사진';

-- 게시물_사진
ALTER TABLE mv_post_phot
    ADD CONSTRAINT PK_mv_post_phot -- 게시물_사진 기본키
        PRIMARY KEY (
            pno -- 사진번호
        );

-- 게시물_사진 유니크 인덱스
CREATE UNIQUE INDEX UIX_mv_post_phot
    ON mv_post_phot ( -- 게시물_사진
        phot ASC -- 사진명
    );

ALTER TABLE mv_post_phot
    MODIFY COLUMN pno INTEGER NOT NULL AUTO_INCREMENT COMMENT '사진번호';

-- 로그 읽음 테이블
CREATE TABLE mv_chk_log (
    mno  INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
    lgno INTEGER NOT NULL COMMENT '로그번호' -- 로그번호
)
COMMENT '로그 읽음 테이블';

-- 로그 읽음 테이블
ALTER TABLE mv_chk_log
    ADD CONSTRAINT PK_mv_chk_log -- 로그 읽음 테이블 기본키
        PRIMARY KEY (
            mno,  -- 회원번호
            lgno  -- 로그번호
        );

-- 게시물유형
CREATE TABLE mv_post_type (
    ptno INTEGER NOT NULL COMMENT '게시물타입번호', -- 게시물타입번호
    type CHAR(2) NOT NULL COMMENT '게시 유형' -- 게시 유형
)
COMMENT '게시물유형';

-- 게시물유형
ALTER TABLE mv_post_type
    ADD CONSTRAINT PK_mv_post_type -- 게시물유형 기본키
        PRIMARY KEY (
            ptno -- 게시물타입번호
        );

-- 게시물_해시태그
CREATE TABLE mv_post_tag (
    tagno INTEGER     NOT NULL COMMENT '해시태그번호', -- 해시태그번호
    cont  VARCHAR(50) NULL     COMMENT '태그내용', -- 태그내용
    pstno INTEGER     NULL     COMMENT '게시물번호' -- 게시물번호
)
COMMENT '게시물_해시태그';

-- 게시물_해시태그
ALTER TABLE mv_post_tag
    ADD CONSTRAINT PK_mv_post_tag -- 게시물_해시태그 기본키
        PRIMARY KEY (
            tagno -- 해시태그번호
        );

-- 게시물_해시태그 인덱스
CREATE INDEX IX_mv_post_tag
    ON mv_post_tag( -- 게시물_해시태그
        cont ASC -- 태그내용
    );

-- 회원선호장르
CREATE TABLE mv_memb_gr (
    mno  INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
    grno INTEGER NOT NULL COMMENT '장르번호' -- 장르번호
)
COMMENT '회원선호장르';

-- 회원선호장르
ALTER TABLE mv_memb_gr
    ADD CONSTRAINT PK_mv_memb_gr -- 회원선호장르 기본키
        PRIMARY KEY (
            mno,  -- 회원번호
            grno  -- 장르번호
        );

-- 신고 유형
CREATE TABLE mv_rpt_type (
    rptno INTEGER NOT NULL COMMENT '신고번호', -- 신고번호
    type  CHAR(1) NOT NULL COMMENT '신고 유형' -- 신고 유형
)
COMMENT '신고 유형';

-- 신고 유형
ALTER TABLE mv_rpt_type
    ADD CONSTRAINT PK_mv_rpt_type -- 신고 유형 기본키
        PRIMARY KEY (
            rptno -- 신고번호
        );

-- 영화장르
CREATE TABLE mv_mv_gr (
    grno INTEGER NOT NULL COMMENT '장르번호', -- 장르번호
    mvno INTEGER NOT NULL COMMENT '영화번호' -- 영화번호
)
COMMENT '영화장르';

-- 영화장르
ALTER TABLE mv_mv_gr
    ADD CONSTRAINT PK_mv_mv_gr -- 영화장르 기본키
        PRIMARY KEY (
            grno, -- 장르번호
            mvno  -- 영화번호
        );

-- 게시물
ALTER TABLE mv_post
    ADD CONSTRAINT FK_mv_memb_TO_mv_post -- 회원 -> 게시물
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 게시물
ALTER TABLE mv_post
    ADD CONSTRAINT FK_mv_post_type_TO_mv_post -- 게시물유형 -> 게시물
        FOREIGN KEY (
            ptno -- 게시물타입번호
        )
        REFERENCES mv_post_type ( -- 게시물유형
            ptno -- 게시물타입번호
        );

-- 게시물
ALTER TABLE mv_post
    ADD CONSTRAINT FK_mv_mv_TO_mv_post -- 영화 -> 게시물
        FOREIGN KEY (
            mvno -- 영화번호
        )
        REFERENCES mv_mv ( -- 영화
            mvno -- 영화번호
        );

-- 게시물댓글
ALTER TABLE mv_post_cmt
    ADD CONSTRAINT FK_mv_memb_TO_mv_post_cmt -- 회원 -> 게시물댓글
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 게시물댓글
ALTER TABLE mv_post_cmt
    ADD CONSTRAINT FK_mv_post_TO_mv_post_cmt -- 게시물 -> 게시물댓글
        FOREIGN KEY (
            pstno -- 게시물번호
        )
        REFERENCES mv_post ( -- 게시물
            pstno -- 게시물번호
        );

-- 영화분석
ALTER TABLE mv_mv_anly
    ADD CONSTRAINT FK_mv_memb_TO_mv_mv_anly -- 회원 -> 영화분석
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 영화분석
ALTER TABLE mv_mv_anly
    ADD CONSTRAINT FK_mv_mv_TO_mv_mv_anly -- 영화 -> 영화분석
        FOREIGN KEY (
            mvno -- 영화번호
        )
        REFERENCES mv_mv ( -- 영화
            mvno -- 영화번호
        );

-- 로그
ALTER TABLE mv_log
    ADD CONSTRAINT FK_mv_memb_TO_mv_log -- 회원 -> 로그
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 장면앨범
ALTER TABLE mv_lbm
    ADD CONSTRAINT FK_mv_memb_TO_mv_lbm -- 회원 -> 장면앨범
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 장면리뷰
ALTER TABLE mv_sr
    ADD CONSTRAINT FK_mv_memb_TO_mv_sr -- 회원 -> 장면리뷰
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 장면리뷰
ALTER TABLE mv_sr
    ADD CONSTRAINT FK_mv_mv_TO_mv_sr -- 영화 -> 장면리뷰
        FOREIGN KEY (
            mvno -- 영화번호
        )
        REFERENCES mv_mv ( -- 영화
            mvno -- 영화번호
        );

-- 장면리뷰_댓글
ALTER TABLE mv_sr_cmt
    ADD CONSTRAINT FK_mv_sr_TO_mv_sr_cmt -- 장면리뷰 -> 장면리뷰_댓글
        FOREIGN KEY (
            srno -- 장면번호
        )
        REFERENCES mv_sr ( -- 장면리뷰
            srno -- 장면번호
        );

-- 장면리뷰_댓글
ALTER TABLE mv_sr_cmt
    ADD CONSTRAINT FK_mv_memb_TO_mv_sr_cmt -- 회원 -> 장면리뷰_댓글
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 장면리뷰_댓글지도
ALTER TABLE mv_sr_map
    ADD CONSTRAINT FK_mv_sr_cmt_TO_mv_sr_map -- 장면리뷰_댓글 -> 장면리뷰_댓글지도
        FOREIGN KEY (
            cmno -- 장면리뷰댓글번호
        )
        REFERENCES mv_sr_cmt ( -- 장면리뷰_댓글
            cmno -- 장면리뷰댓글번호
        );

-- 신고
ALTER TABLE mv_rpt
    ADD CONSTRAINT FK_mv_memb_TO_mv_rpt -- 회원 -> 신고
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 장르분석
ALTER TABLE mv_gr_anly
    ADD CONSTRAINT FK_mv_memb_TO_mv_gr_anly -- 회원 -> 장르분석
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 장르분석
ALTER TABLE mv_gr_anly
    ADD CONSTRAINT FK_mv_gr_TO_mv_gr_anly -- 장르 -> 장르분석
        FOREIGN KEY (
            grno -- 장르번호
        )
        REFERENCES mv_gr ( -- 장르
            grno -- 장르번호
        );

-- 팔로우
ALTER TABLE mv_flw
    ADD CONSTRAINT FK_mv_memb_TO_mv_flw -- 회원 -> 팔로우
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 팔로우
ALTER TABLE mv_flw
    ADD CONSTRAINT FK_mv_memb_TO_mv_flw2 -- 회원 -> 팔로우2
        FOREIGN KEY (
            flw -- 팔로우
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 게시물친구태그
ALTER TABLE mv_frd_tag
    ADD CONSTRAINT FK_mv_post_TO_mv_frd_tag -- 게시물 -> 게시물친구태그
        FOREIGN KEY (
            pstno -- 게시물번호
        )
        REFERENCES mv_post ( -- 게시물
            pstno -- 게시물번호
        );

-- 게시물친구태그
ALTER TABLE mv_frd_tag
    ADD CONSTRAINT FK_mv_memb_TO_mv_frd_tag -- 회원 -> 게시물친구태그
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 장면리뷰_해시태그
ALTER TABLE mv_sr_tag
    ADD CONSTRAINT FK_mv_sr_cmt_TO_mv_sr_tag -- 장면리뷰_댓글 -> 장면리뷰_해시태그
        FOREIGN KEY (
            cmno -- 장면리뷰댓글번호
        )
        REFERENCES mv_sr_cmt ( -- 장면리뷰_댓글
            cmno -- 장면리뷰댓글번호
        );

-- 추천영화
ALTER TABLE mv_rcmd
    ADD CONSTRAINT FK_mv_thm_TO_mv_rcmd -- 관리자추천테마 -> 추천영화
        FOREIGN KEY (
            thmno -- 테마번호
        )
        REFERENCES mv_thm ( -- 관리자추천테마
            thmno -- 테마번호
        );

-- 추천영화
ALTER TABLE mv_rcmd
    ADD CONSTRAINT FK_mv_mv_TO_mv_rcmd -- 영화 -> 추천영화
        FOREIGN KEY (
            mvno -- 영화번호
        )
        REFERENCES mv_mv ( -- 영화
            mvno -- 영화번호
        );

-- 장면리뷰_앨범참조
ALTER TABLE mv_lbm_sr
    ADD CONSTRAINT FK_mv_lbm_TO_mv_lbm_sr -- 장면앨범 -> 장면리뷰_앨범참조
        FOREIGN KEY (
            lbmno -- 보관함번호
        )
        REFERENCES mv_lbm ( -- 장면앨범
            lbmno -- 보관함번호
        );

-- 장면리뷰_앨범참조
ALTER TABLE mv_lbm_sr
    ADD CONSTRAINT FK_mv_sr_TO_mv_lbm_sr -- 장면리뷰 -> 장면리뷰_앨범참조
        FOREIGN KEY (
            srno -- 장면번호
        )
        REFERENCES mv_sr ( -- 장면리뷰
            srno -- 장면번호
        );

-- 게시물_사진
ALTER TABLE mv_post_phot
    ADD CONSTRAINT FK_mv_post_TO_mv_post_phot -- 게시물 -> 게시물_사진
        FOREIGN KEY (
            pstno -- 게시물번호
        )
        REFERENCES mv_post ( -- 게시물
            pstno -- 게시물번호
        );

-- 로그 읽음 테이블
ALTER TABLE mv_chk_log
    ADD CONSTRAINT FK_mv_memb_TO_mv_chk_log -- 회원 -> 로그 읽음 테이블
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 로그 읽음 테이블
ALTER TABLE mv_chk_log
    ADD CONSTRAINT FK_mv_log_TO_mv_chk_log -- 로그 -> 로그 읽음 테이블
        FOREIGN KEY (
            lgno -- 로그번호
        )
        REFERENCES mv_log ( -- 로그
            lgno -- 로그번호
        );

-- 게시물_해시태그
ALTER TABLE mv_post_tag
    ADD CONSTRAINT FK_mv_post_TO_mv_post_tag -- 게시물 -> 게시물_해시태그
        FOREIGN KEY (
            pstno -- 게시물번호
        )
        REFERENCES mv_post ( -- 게시물
            pstno -- 게시물번호
        );

-- 회원선호장르
ALTER TABLE mv_memb_gr
    ADD CONSTRAINT FK_mv_memb_TO_mv_memb_gr -- 회원 -> 회원선호장르
        FOREIGN KEY (
            mno -- 회원번호
        )
        REFERENCES mv_memb ( -- 회원
            mno -- 회원번호
        );

-- 회원선호장르
ALTER TABLE mv_memb_gr
    ADD CONSTRAINT FK_mv_gr_TO_mv_memb_gr -- 장르 -> 회원선호장르
        FOREIGN KEY (
            grno -- 장르번호
        )
        REFERENCES mv_gr ( -- 장르
            grno -- 장르번호
        );

-- 신고 유형
ALTER TABLE mv_rpt_type
    ADD CONSTRAINT FK_mv_rpt_TO_mv_rpt_type -- 신고 -> 신고 유형
        FOREIGN KEY (
            rptno -- 신고번호
        )
        REFERENCES mv_rpt ( -- 신고
            rptno -- 신고번호
        );

-- 영화장르
ALTER TABLE mv_mv_gr
    ADD CONSTRAINT FK_mv_gr_TO_mv_mv_gr -- 장르 -> 영화장르
        FOREIGN KEY (
            grno -- 장르번호
        )
        REFERENCES mv_gr ( -- 장르
            grno -- 장르번호
        );

-- 영화장르
ALTER TABLE mv_mv_gr
    ADD CONSTRAINT FK_mv_mv_TO_mv_mv_gr -- 영화 -> 영화장르
        FOREIGN KEY (
            mvno -- 영화번호
        )
        REFERENCES mv_mv ( -- 영화
            mvno -- 영화번호
        );