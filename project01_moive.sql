-- ========================================================
-- 1. 마스터 / 독립 엔티티 테이블 (참조 대상이 없는 테이블)
-- ========================================================

-- 회원
CREATE TABLE "member" (
    "member_id"    NUMBER NOT NULL,
    "id"           VARCHAR2(50) NULL,
    "pw"           VARCHAR2(50) NULL,
    CONSTRAINT "PK_member" PRIMARY KEY ("member_id")
);

-- 장르종류
CREATE TABLE "genre" (
    "genre_id"     NUMBER NOT NULL,
    "genre_name"   VARCHAR2(50) NULL,
    CONSTRAINT "PK_genre" PRIMARY KEY ("genre_id")
);

-- 국가종류
CREATE TABLE "country" (
    "country_id"   NUMBER NOT NULL,
    "country_name" VARCHAR2(50) NULL,
    CONSTRAINT "PK_country" PRIMARY KEY ("country_id")
);

-- 포토
CREATE TABLE "photo" (
    "photo_id"      NUMBER NOT NULL,
    "photo_content" VARCHAR2(255) NULL,
    CONSTRAINT "PK_photo" PRIMARY KEY ("photo_id")
);

-- 비디오
CREATE TABLE "video" (
    "video_id"      NUMBER NOT NULL,
    "video_content" VARCHAR2(255) NULL,
    CONSTRAINT "PK_video" PRIMARY KEY ("video_id")
);

-- 회사
CREATE TABLE "company" (
    "company_id"   NUMBER NOT NULL,
    "company_name" VARCHAR2(50) NULL,
    CONSTRAINT "PK_company" PRIMARY KEY ("company_id")
);

-- 스탭
CREATE TABLE "staff" (
    "staff_id"     NUMBER NOT NULL,
    "staff_name"   VARCHAR2(50) NULL,
    CONSTRAINT "PK_staff" PRIMARY KEY ("staff_id")
);

-- 배우
CREATE TABLE "actor" (
    "actor_id"     NUMBER NOT NULL,
    "actor_name"   VARCHAR2(50) NULL,
    CONSTRAINT "PK_actor" PRIMARY KEY ("actor_id")
);

-- 감독
CREATE TABLE "director" (
    "director_id"   NUMBER NOT NULL,
    "director_name" VARCHAR2(50) NULL,
    CONSTRAINT "PK_director" PRIMARY KEY ("director_id")
);

-- 전문가
CREATE TABLE "expert" (
    "expert_id"    NUMBER NOT NULL,
    "expert_name"  VARCHAR2(50) NULL,
    CONSTRAINT "PK_expert" PRIMARY KEY ("expert_id")
);

-- 기사
CREATE TABLE "magazine" (
    "magazine_id"    NUMBER NOT NULL,
    "magazine_photo" VARCHAR2(255) NULL,
    "magazine_title" VARCHAR2(100) NULL,
    CONSTRAINT "PK_magazine" PRIMARY KEY ("magazine_id")
);


-- ========================================================
-- 2. 영화 기본 정보 테이블
-- ========================================================

-- 영화
CREATE TABLE "movie" (
    "movie_id"        NUMBER NOT NULL,
    "title"           VARCHAR2(100) NULL,
    "title2"          VARCHAR2(100) NULL,
    "release_date"    NUMBER NULL,
    "general_rate"    VARCHAR2(50) NULL,
    "runtime"         NUMBER NULL,
    "whole_audience"  NUMBER NULL,
    "movie_director"  VARCHAR2(50) NULL,
    "movie_actor"     VARCHAR2(50) NULL,
    "movie_rate"      NUMBER NULL,
    CONSTRAINT "PK_movie" PRIMARY KEY ("movie_id")
);


-- ========================================================
-- 3. 랭킹 관련 테이블
-- ========================================================

-- 영화랭킹
CREATE TABLE "movie_rank_page" (
    "movie_rank_id" NUMBER NOT NULL,
    "member_id"     NUMBER NULL,
    CONSTRAINT "PK_movie_rank_page" PRIMARY KEY ("movie_rank_id"),
    CONSTRAINT "FK_member_TO_rank_page" FOREIGN KEY ("member_id") REFERENCES "member" ("member_id")
);

-- 영화주간랭킹
CREATE TABLE "movie_rank_week" (
    "movie_rank_week_id" NUMBER NOT NULL,
    "movie_rank_id"      NUMBER NULL,
    CONSTRAINT "PK_movie_rank_week" PRIMARY KEY ("movie_rank_week_id"),
    CONSTRAINT "FK_rank_page_TO_rank_week" FOREIGN KEY ("movie_rank_id") REFERENCES "movie_rank_page" ("movie_rank_id")
);

-- 주간영화
CREATE TABLE "weekly_movie" (
    "movie_week_id"      NUMBER NOT NULL,
    "movie_rank_week_id" NUMBER NULL,
    "movie_id"           NUMBER NULL,
    "release_date"       NUMBER NULL,
    "title"              VARCHAR2(100) NULL,
    "rate"               NUMBER NULL,
    "whole_audience"     NUMBER NULL,
    "week_audience"      NUMBER NULL,
    CONSTRAINT "PK_weekly_movie" PRIMARY KEY ("movie_week_id"),
    CONSTRAINT "FK_rank_week_TO_weekly_movie" FOREIGN KEY ("movie_rank_week_id") REFERENCES "movie_rank_week" ("movie_rank_week_id"),
    CONSTRAINT "FK_movie_TO_weekly_movie" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);


-- ========================================================
-- 4. 영화 하위 및 전문가 정보 테이블 (1:N 및 연결 테이블)
-- ========================================================

-- 시놉시스
CREATE TABLE "synopsis" (
    "synopsis_id"      NUMBER NOT NULL,
    "movie_id"         NUMBER NULL,
    "synopsis_content" VARCHAR2(100) NULL,
    CONSTRAINT "PK_synopsis" PRIMARY KEY ("synopsis_id"),
    CONSTRAINT "FK_movie_TO_synopsis" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 리뷰
CREATE TABLE "review" (
    "review_id"      NUMBER NOT NULL,
    "movie_id"       NUMBER NULL,
    "member_id"      NUMBER NULL,
    "user_name"      VARCHAR2(50) NULL,
    "user_rate"      NUMBER NULL,
    "review_content" VARCHAR2(1500) NULL,
    "written_date"   NUMBER NULL,
    CONSTRAINT "PK_review" PRIMARY KEY ("review_id"),
    CONSTRAINT "FK_movie_TO_review" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id"),
    CONSTRAINT "FK_member_TO_review" FOREIGN KEY ("member_id") REFERENCES "member" ("member_id")
);

-- 전문가별점
CREATE TABLE "expert_rate" (
    "expert_rate_id"      NUMBER NOT NULL,
    "expert_id"           NUMBER NOT NULL,
    "expert_rate_content" NUMBER NULL,
    "expert_review"       VARCHAR2(100) NULL,
    CONSTRAINT "PK_expert_rate" PRIMARY KEY ("expert_rate_id"),
    CONSTRAINT "FK_expert_TO_expert_rate" FOREIGN KEY ("expert_id") REFERENCES "expert" ("expert_id")
);

-- 전문가별점목록
CREATE TABLE "expert_rate_list" (
    "expert_rate_list_id" NUMBER NOT NULL,
    "expert_rate_id"      NUMBER NOT NULL,
    "expert_id"           NUMBER NOT NULL,
    "movie_id"            NUMBER NULL,
    CONSTRAINT "PK_expert_rate_list" PRIMARY KEY ("expert_rate_list_id"),
    CONSTRAINT "FK_expert_rate_TO_list" FOREIGN KEY ("expert_rate_id") REFERENCES "expert_rate" ("expert_rate_id"),
    CONSTRAINT "FK_expert_TO_rate_list" FOREIGN KEY ("expert_id") REFERENCES "expert" ("expert_id"),
    CONSTRAINT "FK_movie_TO_expert_rate_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);


-- ========================================================
-- 5. 영화 매핑 / 목록 테이블 (다대다 및 다중 속성 관리)
-- ========================================================

-- 장르목록
CREATE TABLE "genre_list" (
    "genre_list_id" NUMBER NOT NULL,
    "genre_id"      NUMBER NOT NULL,
    "movie_id"      NUMBER NULL,
    CONSTRAINT "PK_genre_list" PRIMARY KEY ("genre_list_id"),
    CONSTRAINT "FK_genre_TO_genre_list" FOREIGN KEY ("genre_id") REFERENCES "genre" ("genre_id"),
    CONSTRAINT "FK_movie_TO_genre_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 국가목록
CREATE TABLE "country_list" (
    "country_list_id" NUMBER NOT NULL,
    "country_id"      NUMBER NOT NULL,
    "movie_id"        NUMBER NULL,
    CONSTRAINT "PK_country_list" PRIMARY KEY ("country_list_id"),
    CONSTRAINT "FK_country_TO_country_list" FOREIGN KEY ("country_id") REFERENCES "country" ("country_id"),
    CONSTRAINT "FK_movie_TO_country_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 포토목록
CREATE TABLE "photo_list" (
    "photo_list_id" NUMBER NOT NULL,
    "photo_id"      NUMBER NOT NULL,
    "movie_id"      NUMBER NULL,
    CONSTRAINT "PK_photo_list" PRIMARY KEY ("photo_list_id"),
    CONSTRAINT "FK_photo_TO_photo_list" FOREIGN KEY ("photo_id") REFERENCES "photo" ("photo_id"),
    CONSTRAINT "FK_movie_TO_photo_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 비디오목록
CREATE TABLE "video_list" (
    "video_list_id" NUMBER NOT NULL,
    "video_id"      NUMBER NOT NULL,
    "movie_id"      NUMBER NULL,
    CONSTRAINT "PK_video_list" PRIMARY KEY ("video_list_id"),
    CONSTRAINT "FK_video_TO_video_list" FOREIGN KEY ("video_id") REFERENCES "video" ("video_id"),
    CONSTRAINT "FK_movie_TO_video_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 회사목록
CREATE TABLE "company_list" (
    "company_list_id" NUMBER NOT NULL,
    "company_id"      NUMBER NOT NULL,
    "movie_id"        NUMBER NULL,
    CONSTRAINT "PK_company_list" PRIMARY KEY ("company_list_id"),
    CONSTRAINT "FK_company_TO_company_list" FOREIGN KEY ("company_id") REFERENCES "company" ("company_id"),
    CONSTRAINT "FK_movie_TO_company_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 스탭목록
CREATE TABLE "staff_list" (
    "staff_list_id" NUMBER NOT NULL,
    "staff_id"      NUMBER NOT NULL,
    "movie_id"      NUMBER NULL,
    CONSTRAINT "PK_staff_list" PRIMARY KEY ("staff_list_id"),
    CONSTRAINT "FK_staff_TO_staff_list" FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id"),
    CONSTRAINT "FK_movie_TO_staff_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 감독과배우목록
CREATE TABLE "director_actor_list" (
    "director_actor_list_id" NUMBER NOT NULL,
    "director_id"            NUMBER NOT NULL,
    "actor_id"               NUMBER NOT NULL,
    "movie_id"               NUMBER NULL,
    CONSTRAINT "PK_director_actor_list" PRIMARY KEY ("director_actor_list_id"),
    CONSTRAINT "FK_director_TO_cast_list" FOREIGN KEY ("director_id") REFERENCES "director" ("director_id"),
    CONSTRAINT "FK_actor_TO_cast_list" FOREIGN KEY ("actor_id") REFERENCES "actor" ("actor_id"),
    CONSTRAINT "FK_movie_TO_cast_list" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 관련기사목록
CREATE TABLE "related_magazine" (
    "related_magazine_id" NUMBER NOT NULL,
    "magazine_id"         NUMBER NOT NULL,
    "movie_id"            NUMBER NULL,
    CONSTRAINT "PK_related_magazine" PRIMARY KEY ("related_magazine_id"),
    CONSTRAINT "FK_magazine_TO_related" FOREIGN KEY ("magazine_id") REFERENCES "magazine" ("magazine_id"),
    CONSTRAINT "FK_movie_TO_related" FOREIGN KEY ("movie_id") REFERENCES "movie" ("movie_id")
);

-- 조회 구문------------------------------------

-- 1. 회원 조회
SELECT * FROM "member";

-- 2. 장르종류 조회
SELECT * FROM "genre";

-- 3. 국가종류 조회
SELECT * FROM "country";

-- 4. 포토 원본 조회
SELECT * FROM "photo";

-- 5. 비디오 원본 조회
SELECT * FROM "video";

-- 6. 회사 조회
SELECT * FROM "company";

-- 7. 스탭 조회
SELECT * FROM "staff";

-- 8. 배우 조회
SELECT * FROM "actor";

-- 9. 감독 조회
SELECT * FROM "director";

-- 10. 전문가 조회
SELECT * FROM "expert";

-- 11. 기사 조회
SELECT * FROM "magazine";

-- 12. 영화 기본 정보 조회
SELECT * FROM "movie";

-- 13. 영화랭킹 조회
SELECT * FROM "movie_rank_page";

-- 14. 영화주간랭킹 조회
SELECT * FROM "movie_rank_week";

-- 15. 주간영화 데이터 조회
SELECT * FROM "weekly_movie";

-- 16. 시놉시스 조회
SELECT * FROM "synopsis";

-- 17. 유저 리뷰 조회
SELECT * FROM "review";

-- 18. 전문가 별점 조회
SELECT * FROM "expert_rate";

-- 19. 전문가 별점 목록 조회
SELECT * FROM "expert_rate_list";

-- 20. 장르목록 매핑 조회
SELECT * FROM "genre_list";

-- 21. 국가목록 매핑 조회
SELECT * FROM "country_list";

-- 22. 포토목록 매핑 조회
SELECT * FROM "photo_list";

-- 23. 비디오목록 매핑 조회
SELECT * FROM "video_list";

-- 24. 회사목록 매핑 조회
SELECT * FROM "company_list";

-- 25. 스탭목록 매핑 조회
SELECT * FROM "staff_list";

-- 26. 감독과배우목록 매핑 조회
SELECT * FROM "director_actor_list";

-- 27. 관련기사목록 매핑 조회
SELECT * FROM "related_magazine";

-- DROP 구문------------------------------------

-- 1. 매핑 및 목록 테이블 삭제
DROP TABLE "related_magazine" CASCADE CONSTRAINTS;
DROP TABLE "director_actor_list" CASCADE CONSTRAINTS;
DROP TABLE "staff_list" CASCADE CONSTRAINTS;
DROP TABLE "company_list" CASCADE CONSTRAINTS;
DROP TABLE "video_list" CASCADE CONSTRAINTS;
DROP TABLE "photo_list" CASCADE CONSTRAINTS;
DROP TABLE "country_list" CASCADE CONSTRAINTS;
DROP TABLE "genre_list" CASCADE CONSTRAINTS;

-- 2. 영화 상세 및 평가 테이블 삭제
DROP TABLE "expert_rate_list" CASCADE CONSTRAINTS;
DROP TABLE "expert_rate" CASCADE CONSTRAINTS;
DROP TABLE "review" CASCADE CONSTRAINTS;
DROP TABLE "synopsis" CASCADE CONSTRAINTS;

-- 3. 랭킹 관련 테이블 삭제
DROP TABLE "weekly_movie" CASCADE CONSTRAINTS;
DROP TABLE "movie_rank_week" CASCADE CONSTRAINTS;
DROP TABLE "movie_rank_page" CASCADE CONSTRAINTS;

-- 4. 영화 기본 테이블 삭제
DROP TABLE "movie" CASCADE CONSTRAINTS;

-- 5. 마스터 / 독립 엔티티 테이블 삭제
DROP TABLE "magazine" CASCADE CONSTRAINTS;
DROP TABLE "expert" CASCADE CONSTRAINTS;
DROP TABLE "director" CASCADE CONSTRAINTS;
DROP TABLE "actor" CASCADE CONSTRAINTS;
DROP TABLE "staff" CASCADE CONSTRAINTS;
DROP TABLE "company" CASCADE CONSTRAINTS;
DROP TABLE "video" CASCADE CONSTRAINTS;
DROP TABLE "photo" CASCADE CONSTRAINTS;
DROP TABLE "country" CASCADE CONSTRAINTS;
DROP TABLE "genre" CASCADE CONSTRAINTS;
DROP TABLE "member" CASCADE CONSTRAINTS;