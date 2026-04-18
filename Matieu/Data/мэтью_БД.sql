--
-- PostgreSQL database dump
--

\restrict lJwvI1VtkiVKwP519lt4WjQFl78GQXrW4ZG3sHFPdwhi61tLxUMRExgarLI9c0c

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-04-17 21:27:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5000 (class 1262 OID 38679)
-- Name: matieu; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE matieu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE matieu OWNER TO postgres;

\unrestrict lJwvI1VtkiVKwP519lt4WjQFl78GQXrW4ZG3sHFPdwhi61tLxUMRExgarLI9c0c
\connect matieu
\restrict lJwvI1VtkiVKwP519lt4WjQFl78GQXrW4ZG3sHFPdwhi61tLxUMRExgarLI9c0c

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 38757)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    master_id integer NOT NULL,
    service_id integer NOT NULL,
    queue_number integer NOT NULL,
    appointment_date timestamp without time zone DEFAULT now(),
    status character varying(50) DEFAULT 'pending'::character varying
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 38756)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 229
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 222 (class 1259 OID 38705)
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 38704)
-- Name: collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collections_id_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 221
-- Name: collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collections_id_seq OWNED BY public.collections.id;


--
-- TOC entry 228 (class 1259 OID 38740)
-- Name: master_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_services (
    id integer NOT NULL,
    master_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.master_services OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 38739)
-- Name: master_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.master_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.master_services_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 227
-- Name: master_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.master_services_id_seq OWNED BY public.master_services.id;


--
-- TOC entry 224 (class 1259 OID 38712)
-- Name: masters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.masters (
    id integer NOT NULL,
    user_id integer NOT NULL,
    qualification_level integer DEFAULT 1
);


ALTER TABLE public.masters OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 38711)
-- Name: masters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.masters_id_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 223
-- Name: masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.masters_id_seq OWNED BY public.masters.id;


--
-- TOC entry 234 (class 1259 OID 38807)
-- Name: qualification_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qualification_requests (
    id integer NOT NULL,
    master_id integer NOT NULL,
    status character varying(50) DEFAULT 'pending'::character varying,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.qualification_requests OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 38806)
-- Name: qualification_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qualification_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.qualification_requests_id_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 233
-- Name: qualification_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qualification_requests_id_seq OWNED BY public.qualification_requests.id;


--
-- TOC entry 232 (class 1259 OID 38781)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer NOT NULL,
    service_id integer,
    master_id integer,
    rating integer,
    comment text,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 38780)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 231
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 218 (class 1259 OID 38681)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 38680)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 226 (class 1259 OID 38725)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    category character varying(50) NOT NULL,
    collection_id integer,
    image_path character varying(300),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 38724)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 225
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 220 (class 1259 OID 38688)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    full_name character varying(200) NOT NULL,
    balance numeric(10,2) DEFAULT 0,
    role_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 38687)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4791 (class 2604 OID 38760)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 38708)
-- Name: collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections ALTER COLUMN id SET DEFAULT nextval('public.collections_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 38743)
-- Name: master_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_services ALTER COLUMN id SET DEFAULT nextval('public.master_services_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 38715)
-- Name: masters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.masters ALTER COLUMN id SET DEFAULT nextval('public.masters_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 38810)
-- Name: qualification_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification_requests ALTER COLUMN id SET DEFAULT nextval('public.qualification_requests_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 38784)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 38684)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 38728)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 38691)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4990 (class 0 OID 38757)
-- Dependencies: 230
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointments VALUES (1, 3, 1, 1, 1, '2026-04-17 20:33:18.577385', 'pending') ON CONFLICT DO NOTHING;
INSERT INTO public.appointments VALUES (2, 4, 2, 8, 2, '2026-04-17 20:33:18.577385', 'pending') ON CONFLICT DO NOTHING;
INSERT INTO public.appointments VALUES (3, 8, 1, 3, 3, '2026-04-17 20:33:18.577385', 'completed') ON CONFLICT DO NOTHING;
INSERT INTO public.appointments VALUES (4, 9, 3, 13, 1, '2026-04-17 20:33:18.577385', 'pending') ON CONFLICT DO NOTHING;
INSERT INTO public.appointments VALUES (5, 3, 2, 9, 4, '2026-04-17 20:33:18.577385', 'pending') ON CONFLICT DO NOTHING;


--
-- TOC entry 4982 (class 0 OID 38705)
-- Dependencies: 222
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.collections VALUES (1, 'Аниме') ON CONFLICT DO NOTHING;
INSERT INTO public.collections VALUES (2, 'Новый год') ON CONFLICT DO NOTHING;
INSERT INTO public.collections VALUES (3, 'Хэллоуин') ON CONFLICT DO NOTHING;
INSERT INTO public.collections VALUES (4, 'Киберпанк') ON CONFLICT DO NOTHING;
INSERT INTO public.collections VALUES (5, 'Нуар') ON CONFLICT DO NOTHING;


--
-- TOC entry 4988 (class 0 OID 38740)
-- Dependencies: 228
-- Data for Name: master_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.master_services VALUES (1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (3, 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (4, 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (5, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (6, 1, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (7, 2, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (8, 2, 8) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (9, 2, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (10, 2, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (11, 2, 11) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (12, 2, 12) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (13, 3, 13) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (14, 3, 14) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (15, 3, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (16, 3, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (17, 3, 17) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (18, 3, 18) ON CONFLICT DO NOTHING;
INSERT INTO public.master_services VALUES (19, 3, 19) ON CONFLICT DO NOTHING;


--
-- TOC entry 4984 (class 0 OID 38712)
-- Dependencies: 224
-- Data for Name: masters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.masters VALUES (1, 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.masters VALUES (2, 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.masters VALUES (3, 7, 3) ON CONFLICT DO NOTHING;


--
-- TOC entry 4994 (class 0 OID 38807)
-- Dependencies: 234
-- Data for Name: qualification_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qualification_requests VALUES (1, 2, 'pending', '2026-04-17 21:21:09.33504') ON CONFLICT DO NOTHING;
INSERT INTO public.qualification_requests VALUES (2, 3, 'approved', '2026-04-17 21:21:09.33504') ON CONFLICT DO NOTHING;


--
-- TOC entry 4992 (class 0 OID 38781)
-- Dependencies: 232
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reviews VALUES (1, 3, 1, 1, 5, 'Отличная работа, очень доволен!', '2026-04-17 20:33:18.699191') ON CONFLICT DO NOTHING;
INSERT INTO public.reviews VALUES (2, 4, 8, 2, 4, 'Хорошее качество, немного долго', '2026-04-17 20:33:18.699191') ON CONFLICT DO NOTHING;
INSERT INTO public.reviews VALUES (3, 8, 3, 1, 5, 'Превзошло все ожидания', '2026-04-17 20:33:18.699191') ON CONFLICT DO NOTHING;
INSERT INTO public.reviews VALUES (4, 9, 13, 3, 4, 'Красивый костюм, рекомендую', '2026-04-17 20:33:18.699191') ON CONFLICT DO NOTHING;
INSERT INTO public.reviews VALUES (5, 3, 9, 2, 5, 'Мастер настоящий профессионал', '2026-04-17 20:33:18.699191') ON CONFLICT DO NOTHING;


--
-- TOC entry 4978 (class 0 OID 38681)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'admin') ON CONFLICT DO NOTHING;
INSERT INTO public.roles VALUES (2, 'moderator') ON CONFLICT DO NOTHING;
INSERT INTO public.roles VALUES (3, 'user') ON CONFLICT DO NOTHING;
INSERT INTO public.roles VALUES (4, 'master') ON CONFLICT DO NOTHING;


--
-- TOC entry 4986 (class 0 OID 38725)
-- Dependencies: 226
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.services VALUES (1, 'Худи «Акацуки Манга»', 'Чёрная толстовка с принтом персонажа в стиле манги на спине и символом Акацуки на рукаве', 3000.00, 'Custom', 1, 'pr/Custom/Pr1.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (2, 'Худи «Оккультные Ягнята»', 'Чёрная толстовка с изображением ягнят, красной пентаграммой, глазами в небе и цепями', 3200.00, 'Custom', 3, 'pr/Custom/Pr2.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (4, 'Худи «Падший Ангел»', 'Чёрная толстовка с изображением падшего ангела на спине и колючей проволокой на рукавах', 3000.00, 'Custom', 5, 'pr/Custom/Pr4.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (5, 'Худи «LOVE Граффити»', 'Разноцветная толстовка в стиле уличного граффити с сердцем, надписью LOVE и разноцветными брызгами', 3200.00, 'Custom', 4, 'pr/Custom/Pr5.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (6, 'Лонгслив «Ultimate Custom Night»', 'Чёрный лонгслив с сеткой из 50+ аниматроников из игры Five Nights at Freddy''s: Ultimate Custom Night', 2500.00, 'Custom', 3, 'pr/Custom/Pr6.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (7, 'Лонгслив «Motorcycle Skull»', 'Чёрный лонгслив с золотым принтом мотоцикла, черепа и надписью MOTORCYCLES', 2400.00, 'Custom', 5, 'pr/Custom/Pr7.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (8, 'Футболка «Киберпанк Девушка»', 'Чёрная футболка с принтом аниме девушки на фоне неонового киберпанк города', 2000.00, 'Custom', 4, 'pr/Custom/Pr8.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (9, 'Футболка «Унесённые Призраками»', 'Чёрная футболка с принтом персонажа из аниме Studio Ghibli «Унесённые призраками»', 2000.00, 'Custom', 1, 'pr/Custom/Pr9.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (10, 'Футболка «Dark Collage»', 'Чёрная футболка с тёмным коллажем из множества фотографий и изображений на спине', 2000.00, 'Custom', 5, 'pr/Custom/Pr10.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (12, 'Футболка «Аниме с Текстом»', 'Чёрная футболка с принтом аниме персонажа и японскими иероглифами сбоку', 1900.00, 'Custom', 1, 'pr/Custom/Pr12.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (14, 'Футболка «Нагито Комаэда»', 'Белая футболка с красным символом Нагито Комаэды из игры Danganronpa 2', 1200.00, 'Cosplay', 1, 'pr/Cosplay/KL2.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (16, 'Футболка «Пиратский костюм»', 'Футболка с реалистичным принтом пиратского жилета с золотыми пуговицами, поясом и бутылкой рома', 2000.00, 'Cosplay', 3, 'pr/Cosplay/KL4.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (17, 'Худи «Акацуки»', 'Чёрная толстовка с красными облаками организации Акацуки из аниме Наруто, красный капюшон внутри', 3000.00, 'Cosplay', 1, 'pr/Cosplay/KL5.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (18, 'Худи «Самурай Они»', 'Чёрная толстовка с красным демоном-они в стиле японского самурая, надпись SAMURAI, узор на рукаве', 3800.00, 'Cosplay', 5, 'pr/Cosplay/KL6.jpg', '2026-04-17 20:32:53.12562') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (11, 'Футболка «Звездные войны»', 'Чёрная футболка с персонажами из звездных войн мастером йодой и дарт вейдером', 2000.00, 'Custom', 4, 'pr/Custom/Pr11.jpg', '2026-04-17 20:37:23.002057') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (19, 'Худи «Split»', 'Толстовка разделённая на чёрную и белую половины с асимметричным дизайном и принтами', 3000.00, 'Cosplay', 1, 'pr/Cosplay/KL7.jpg', '2026-04-17 20:39:47.587937') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (15, 'Рашгард «Майлз Моралес»', 'Чёрный облегающий рашгард с красным пауком и паутиной в стиле Майлза Моралеса', 2500.00, 'Cosplay', 3, 'pr/Cosplay/KL3.jpg', '2026-04-17 20:39:53.167407') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (13, 'Рашгард «Человек-паук PS4»', 'Облегающая спортивная футболка с принтом костюма Человека-паука из игры Marvel''s Spider-Man: красно-синий дизайн с белым пауком и паутиной', 2000.00, 'Cosplay', 3, 'pr/Cosplay/KL1.jpg', '2026-04-17 20:39:57.058542') ON CONFLICT DO NOTHING;
INSERT INTO public.services VALUES (3, 'Худи «Психоделические Грибы»', 'Чёрная толстовка с яркими красными мухоморами на космическом фоне с неоновыми вспышками', 3200.00, 'Custom', 3, 'pr/Custom/Pr3.jpg', '2026-04-17 20:42:35.563717') ON CONFLICT DO NOTHING;


--
-- TOC entry 4980 (class 0 OID 38688)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'admin', 'admin123', 'Администратор', 0.00, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (2, 'moder1', 'moder123', 'Модератор Первый', 0.00, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (3, 'ivan_petrov', 'pass123', 'Иван Петров', 1500.00, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (4, 'anna_sidorova', 'pass123', 'Анна Сидорова', 2300.00, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (5, 'master_alex', 'pass123', 'Александр Волков', 0.00, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (6, 'master_kate', 'pass123', 'Екатерина Морозова', 0.00, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (7, 'master_dima', 'pass123', 'Дмитрий Козлов', 0.00, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (8, 'olga_nova', 'pass123', 'Ольга Новикова', 500.00, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (9, 'sergey_k', 'pass123', 'Сергей Кузнецов', 3000.00, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (10, 'moder2', 'moder123', 'Модератор Второй', 0.00, 2) ON CONFLICT DO NOTHING;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 229
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 5, true);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 221
-- Name: collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collections_id_seq', 5, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 227
-- Name: master_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.master_services_id_seq', 19, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 223
-- Name: masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.masters_id_seq', 3, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 233
-- Name: qualification_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qualification_requests_id_seq', 2, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 231
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 5, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 225
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 19, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- TOC entry 4815 (class 2606 OID 38764)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 38710)
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 38745)
-- Name: master_services master_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_services
    ADD CONSTRAINT master_services_pkey PRIMARY KEY (id);


--
-- TOC entry 4809 (class 2606 OID 38718)
-- Name: masters masters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.masters
    ADD CONSTRAINT masters_pkey PRIMARY KEY (id);


--
-- TOC entry 4819 (class 2606 OID 38814)
-- Name: qualification_requests qualification_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification_requests
    ADD CONSTRAINT qualification_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 38790)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4801 (class 2606 OID 38686)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 38733)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4803 (class 2606 OID 38698)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 4805 (class 2606 OID 38696)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4825 (class 2606 OID 38770)
-- Name: appointments appointments_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_master_id_fkey FOREIGN KEY (master_id) REFERENCES public.masters(id);


--
-- TOC entry 4826 (class 2606 OID 38775)
-- Name: appointments appointments_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- TOC entry 4827 (class 2606 OID 38765)
-- Name: appointments appointments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4823 (class 2606 OID 38746)
-- Name: master_services master_services_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_services
    ADD CONSTRAINT master_services_master_id_fkey FOREIGN KEY (master_id) REFERENCES public.masters(id);


--
-- TOC entry 4824 (class 2606 OID 38751)
-- Name: master_services master_services_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_services
    ADD CONSTRAINT master_services_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- TOC entry 4821 (class 2606 OID 38719)
-- Name: masters masters_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.masters
    ADD CONSTRAINT masters_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4831 (class 2606 OID 38815)
-- Name: qualification_requests qualification_requests_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification_requests
    ADD CONSTRAINT qualification_requests_master_id_fkey FOREIGN KEY (master_id) REFERENCES public.masters(id);


--
-- TOC entry 4828 (class 2606 OID 38801)
-- Name: reviews reviews_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_master_id_fkey FOREIGN KEY (master_id) REFERENCES public.masters(id);


--
-- TOC entry 4829 (class 2606 OID 38796)
-- Name: reviews reviews_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- TOC entry 4830 (class 2606 OID 38791)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4822 (class 2606 OID 38734)
-- Name: services services_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- TOC entry 4820 (class 2606 OID 38699)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


-- Completed on 2026-04-17 21:27:13

--
-- PostgreSQL database dump complete
--

\unrestrict lJwvI1VtkiVKwP519lt4WjQFl78GQXrW4ZG3sHFPdwhi61tLxUMRExgarLI9c0c

