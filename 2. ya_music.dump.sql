--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    year integer NOT NULL,
    cover_pic_url character varying(250) NOT NULL,
    artist_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: alike_artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alike_artists (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    alike_artist_id integer NOT NULL
);


ALTER TABLE public.alike_artists OWNER TO postgres;

--
-- Name: alike_artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alike_artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alike_artists_id_seq OWNER TO postgres;

--
-- Name: alike_artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alike_artists_id_seq OWNED BY public.alike_artists.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(250) NOT NULL,
    artist_pic_url character varying(250) DEFAULT 'https://artincontext.org/wp-content/uploads/2022/06/forget-me-not-flower-Drawing-10-1.jpg'::character varying
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: audiobooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audiobooks (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    year integer NOT NULL,
    cover_pic_url character varying(250) NOT NULL,
    author_id integer NOT NULL,
    voice_artist_id integer NOT NULL,
    label_id integer NOT NULL,
    adults_only boolean DEFAULT true NOT NULL
);


ALTER TABLE public.audiobooks OWNER TO postgres;

--
-- Name: audiobooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audiobooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audiobooks_id_seq OWNER TO postgres;

--
-- Name: audiobooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audiobooks_id_seq OWNED BY public.audiobooks.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50)
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapters (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    url character varying(250) NOT NULL,
    audiobook_id integer NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL,
    length double precision NOT NULL
);


ALTER TABLE public.chapters OWNER TO postgres;

--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chapters_id_seq OWNER TO postgres;

--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- Name: favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourites (
    user_id integer NOT NULL,
    song_id integer NOT NULL
);


ALTER TABLE public.favourites OWNER TO postgres;

--
-- Name: labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.labels (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(250) NOT NULL
);


ALTER TABLE public.labels OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labels_id_seq OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.labels_id_seq OWNED BY public.labels.id;


--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(50) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_id_seq OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: playlists_songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists_songs (
    playlist_id integer NOT NULL,
    song_id integer NOT NULL
);


ALTER TABLE public.playlists_songs OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    user_id integer NOT NULL,
    profile_pic_url character varying(250) DEFAULT 'https://img.freepik.com/free-vector/sunflower-isolated-white_1284-3463.jpg?w=2000'::character varying,
    created_at timestamp without time zone,
    is_adult boolean DEFAULT false
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    url character varying(250) NOT NULL,
    artist_id integer NOT NULL,
    album_id integer,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL,
    length double precision NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: alike_artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alike_artists ALTER COLUMN id SET DEFAULT nextval('public.alike_artists_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: audiobooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audiobooks ALTER COLUMN id SET DEFAULT nextval('public.audiobooks_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- Name: labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels ALTER COLUMN id SET DEFAULT nextval('public.labels_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, title, year, cover_pic_url, artist_id, label_id) FROM stdin;
1	sagittis semper.	1992	http://wikipedia.org/en-ca?k=0	100	15
2	Integer tincidunt	2018	https://cnn.com/user/110?search=1&q=de	27	13
3	sociis natoque	1985	https://twitter.com/en-ca?search=1	27	72
4	Curabitur massa.	2011	http://netflix.com/en-us?q=0	63	20
5	taciti sociosqu	1995	https://nytimes.com/en-us?q=11	17	73
6	arcu. Vestibulum	2011	https://reddit.com/en-us?p=8	18	4
7	ultrices. Vivamus	1978	http://twitter.com/group/9?ab=441&aad=2	32	63
8	non, feugiat	2006	http://reddit.com/site?page=1&offset=1	88	8
9	Integer urna.	1980	http://cnn.com/group/9?p=8	66	80
10	pellentesque massa	1962	http://walmart.com/en-us?search=1&q=de	37	5
11	molestie tellus.	1965	http://pinterest.com/sub?q=11	89	66
12	luctus felis	2021	http://youtube.com/settings?g=1	84	82
13	magna nec	1970	http://reddit.com/site?str=se	8	85
14	Cras interdum.	2004	https://youtube.com/one?ad=115	55	96
15	amet luctus	1961	https://instagram.com/sub/cars?page=1&offset=1	48	31
16	mauris eu	2012	https://ebay.com/group/9?q=11	7	21
17	vitae, orci.	1986	http://whatsapp.com/sub/cars?g=1	92	77
18	Duis a	1987	https://nytimes.com/en-ca?gi=100	13	55
19	morbi tristique	2019	http://cnn.com/user/110?search=1&q=de	80	74
20	egestas. Aliquam	2008	https://cnn.com/one?search=1&q=de	65	34
21	posuere cubilia	1997	http://twitter.com/sub?k=0	52	82
22	imperdiet ullamcorper.	2015	https://instagram.com/settings?search=1	84	69
23	amet lorem	2009	https://nytimes.com/site?search=1	10	71
24	Donec luctus	1995	http://whatsapp.com/user/110?g=1	38	14
25	a ultricies	2008	http://whatsapp.com/user/110?k=0	55	69
26	semper, dui	1963	http://pinterest.com/sub?gi=100	76	10
27	quis, pede.	1982	http://wikipedia.org/user/110?client=g	85	28
28	lorem. Donec	1965	http://netflix.com/settings?q=4	85	36
29	Duis mi	1994	http://walmart.com/sub/cars?g=1	9	65
30	augue, eu	1974	https://yahoo.com/site?gi=100	94	24
31	arcu. Sed	1978	https://whatsapp.com/fr?g=1	80	60
32	nunc interdum	1985	http://walmart.com/sub?search=1&q=de	87	3
33	nostra, per	2004	http://wikipedia.org/sub/cars?q=11	81	77
34	nunc. In	1982	https://netflix.com/settings?q=4	24	33
35	id, mollis	1962	http://youtube.com/site?ad=115	86	70
36	est, mollis	1998	https://reddit.com/sub/cars?ab=441&aad=2	47	89
37	at augue	2019	http://naver.com/one?q=11	26	76
38	pede blandit	1997	https://cnn.com/one?ad=115	30	24
39	amet, consectetuer	2000	http://facebook.com/user/110?gi=100	85	36
40	ultricies sem	2010	https://bbc.co.uk/en-us?gi=100	53	71
41	risus. Nulla	1970	http://whatsapp.com/one?ad=115	12	38
42	lorem, luctus	2015	http://bbc.co.uk/group/9?q=11	1	7
43	natoque penatibus	2020	https://instagram.com/group/9?g=1	5	67
44	pellentesque eget,	1996	https://ebay.com/sub?q=11	4	18
45	Donec egestas.	1998	https://zoom.us/user/110?q=test	36	95
46	odio tristique	1980	https://facebook.com/en-us?q=4	49	99
47	ornare tortor	2002	https://baidu.com/en-us?g=1	81	5
48	Donec sollicitudin	2003	http://wikipedia.org/settings?g=1	35	27
49	nonummy ultricies	1991	https://naver.com/en-us?search=1	42	73
50	ipsum. Phasellus	1962	https://baidu.com/settings?g=1	59	14
51	nunc interdum	1992	https://zoom.us/sub?str=se	33	86
52	erat vel	1997	http://pinterest.com/en-us?q=test	83	47
53	Phasellus dapibus	1976	http://walmart.com/en-ca?client=g	51	50
54	Nunc ut	1978	https://twitter.com/site?q=11	25	17
55	amet ultricies	2016	https://wikipedia.org/en-us?client=g	88	91
56	eu, ultrices	1966	https://netflix.com/group/9?page=1&offset=1	83	52
57	orci. Donec	1986	http://wikipedia.org/one?q=0	72	23
58	massa. Suspendisse	1972	http://yahoo.com/site?g=1	94	21
59	tempor diam	1982	http://bbc.co.uk/en-us?ab=441&aad=2	15	68
60	dui. Fusce	1988	https://naver.com/one?q=0	26	67
61	amet lorem	1993	http://instagram.com/sub/cars?q=test	45	94
62	lorem fringilla	1980	https://yahoo.com/group/9?search=1	2	68
63	in faucibus	2004	http://naver.com/sub/cars?k=0	76	98
64	congue a,	2021	http://yahoo.com/group/9?search=1&q=de	49	65
65	malesuada augue	1979	https://cnn.com/sub?q=4	57	73
66	imperdiet dictum	2016	https://instagram.com/en-ca?ad=115	46	20
67	imperdiet, erat	1993	https://cnn.com/sub/cars?search=1&q=de	83	75
68	sed turpis	1965	http://yahoo.com/user/110?str=se	52	4
69	ut nisi	2006	https://youtube.com/user/110?ab=441&aad=2	38	85
70	sed, sapien.	2018	https://whatsapp.com/group/9?g=1	17	91
71	erat. Vivamus	2008	https://facebook.com/en-ca?g=1	8	62
72	faucibus orci	1986	http://zoom.us/en-ca?g=1	64	64
73	at, velit.	1970	https://facebook.com/settings?g=1	29	39
74	ut mi.	1996	https://instagram.com/user/110?ab=441&aad=2	83	31
75	urna, nec	1991	https://yahoo.com/fr?k=0	39	80
76	rutrum, justo.	1989	https://cnn.com/one?ab=441&aad=2	20	17
77	mi lacinia	2007	http://twitter.com/en-ca?gi=100	44	40
78	ut dolor	1992	http://reddit.com/sub/cars?q=0	59	43
79	a, arcu.	1973	https://baidu.com/sub?q=test	75	14
80	molestie dapibus	1991	http://facebook.com/one?q=0	97	8
81	accumsan convallis,	1966	http://google.com/sub/cars?k=0	8	44
82	Morbi vehicula.	1987	http://yahoo.com/site?q=test	28	85
83	Cras vulputate	1997	https://instagram.com/settings?search=1&q=de	58	100
84	lectus. Nullam	1982	https://twitter.com/group/9?str=se	1	11
85	vitae diam.	2023	http://wikipedia.org/group/9?k=0	86	27
86	Nullam ut	1975	https://pinterest.com/sub/cars?gi=100	6	69
87	posuere cubilia	1987	https://youtube.com/settings?page=1&offset=1	47	13
88	orci luctus	2007	http://ebay.com/fr?page=1&offset=1	21	81
89	ornare tortor	1975	http://walmart.com/fr?search=1	63	17
90	lorem ac	1979	http://twitter.com/settings?q=4	21	79
91	nunc nulla	1993	https://whatsapp.com/sub/cars?str=se	45	7
92	vestibulum, neque	2013	https://cnn.com/one?search=1&q=den	95	44
93	a sollicitudin	1996	https://wikipedia.org/group/9?q=4	53	43
94	neque non	2016	https://facebook.com/sub?search=1	9	36
95	molestie sodales.	1960	https://zoom.us/sub/cars?search=1&q=de	51	79
96	elit, a	2021	http://whatsapp.com/settings?q=0	10	57
97	velit. Aliquam	2007	http://cnn.com/user/110?q=11	88	70
98	fermentum convallis	1977	http://youtube.com/user/110?gi=100	23	35
99	Duis elementum,	2002	https://bbc.co.uk/group/9?ab=441&aad=2	6	46
100	metus. In	1982	http://walmart.com/user/110?q=4	45	91
\.


--
-- Data for Name: alike_artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alike_artists (id, artist_id, alike_artist_id) FROM stdin;
1	43	48
2	82	29
3	23	48
4	93	41
5	87	68
6	95	81
7	50	90
8	95	49
9	72	61
10	40	94
11	87	64
12	89	58
13	25	45
14	10	75
15	44	33
16	45	32
17	54	16
18	95	55
19	78	42
20	41	71
21	39	92
22	37	23
23	49	82
24	20	6
25	76	93
26	58	55
27	4	46
28	66	15
29	29	82
30	56	22
31	44	19
32	39	72
33	76	82
34	79	15
35	19	34
36	74	16
37	40	64
38	21	86
39	48	60
40	67	100
41	67	85
42	38	49
43	89	24
44	14	64
45	41	82
46	78	37
47	49	38
48	85	98
49	7	98
50	56	96
51	52	27
52	83	91
53	57	18
54	69	51
55	15	71
56	29	18
57	40	71
58	44	83
59	57	2
60	62	90
61	8	92
62	65	74
63	26	68
64	87	89
65	85	57
66	39	27
67	1	72
68	60	18
69	32	72
70	48	62
71	77	5
72	76	55
73	83	64
74	39	29
75	97	87
76	55	84
77	17	70
78	4	86
79	2	44
80	70	53
81	26	44
82	99	15
83	57	54
84	3	9
85	23	45
86	82	36
87	3	50
88	51	98
89	79	11
90	19	18
91	96	97
92	55	42
93	61	26
94	2	28
95	49	37
96	19	72
97	79	95
98	82	89
99	50	77
100	81	17
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name, description, artist_pic_url) FROM stdin;
1	Mira Holloway	semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices	http://twitter.com/one?q=0
2	Murphy Carlson	nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat.	http://ebay.com/fr?search=1
3	Grady Norman	magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem	https://twitter.com/sub?page=1&offset=1
4	Galena Hebert	orci. Ut semper pretium neque. Morbi quis urna. Nunc quis	http://netflix.com/settings?search=1
5	Nevada Stevens	ipsum primis in faucibus orci luctus et ultrices posuere cubilia	https://instagram.com/settings?k=0
6	Tatiana Sullivan	tellus justo sit amet nulla. Donec non justo. Proin non	https://baidu.com/sub/cars?q=11
7	Jamal Henderson	in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum	http://cnn.com/user/110?search=1&q=de
8	Kiayada Clayton	sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit	http://google.com/group/9?page=1&offset=1
9	Chaim Mcleod	nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in	https://naver.com/user/110?k=0
10	Clayton Mclean	risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,	http://youtube.com/en-us?q=0
11	Pascale Hayes	vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet	https://facebook.com/sub/cars?client=g
12	Nell Hurley	felis eget varius ultrices, mauris ipsum porta elit, a feugiat	https://wikipedia.org/sub?search=1
13	Skyler Lott	Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,	http://guardian.co.uk/settings?str=se
14	Reuben Yates	ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu	http://whatsapp.com/en-us?gi=100
15	Sandra Foley	quis accumsan convallis, ante lectus convallis est, vitae sodales nisi	http://youtube.com/user/110?str=se
16	Colton Hartman	ac mattis velit justo nec ante. Maecenas mi felis, adipiscing	https://reddit.com/en-us?q=test
17	Selma Austin	aptent taciti sociosqu ad litora torquent per conubia nostra, per	https://whatsapp.com/en-us?search=1
18	Erin Tate	tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac	https://whatsapp.com/group/9?k=0
19	Elton Benton	metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus	http://pinterest.com/one?k=0
20	Zephr Britt	imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec,	http://facebook.com/fr?page=1&offset=1
21	Giselle Sutton	nibh enim, gravida sit amet, dapibus id, blandit at, nisi.	https://naver.com/one?g=1
22	Basil Sloan	orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras	http://naver.com/one?client=g
23	Mira Barrera	lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus	https://ebay.com/en-us?search=1&q=de
24	Marcia Bonner	a nunc. In at pede. Cras vulputate velit eu sem.	http://twitter.com/en-us?ab=441&aad=2
25	Leonard Yang	aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend	http://reddit.com/sub?client=g
26	Doris Cherry	quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam	https://reddit.com/en-ca?str=se
27	Kelsey Calderon	hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus.	http://wikipedia.org/sub/cars?q=4
28	Thaddeus Townsend	vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu.	http://nytimes.com/one?g=1
29	Wesley Rodriguez	Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis	https://instagram.com/user/110?q=test
30	Jakeem Mccarty	consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate	https://whatsapp.com/one?q=4
31	Winter Woodard	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,	https://google.com/sub/cars?ab=441&aad=2
32	Caldwell Zamora	sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem	http://wikipedia.org/group/9?q=test
33	Daquan Gaines	semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim	http://facebook.com/group/9?q=11
34	Kirk Merrill	et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum.	http://youtube.com/one?q=0
35	Chaney Moran	Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros.	http://netflix.com/group/9?q=4
36	Brock Mullins	neque. Nullam ut nisi a odio semper cursus. Integer mollis.	https://netflix.com/one?ab=441&aad=2
37	Noah Wong	nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in	https://twitter.com/en-ca?search=1&q=de
38	Elijah Rich	Sed auctor odio a purus. Duis elementum, dui quis accumsan	https://youtube.com/en-us?q=0
39	Logan Ferguson	augue, eu tempor erat neque non quam. Pellentesque habitant morbi	https://wikipedia.org/fr?q=test
40	Irma Henry	odio a purus. Duis elementum, dui quis accumsan convallis, ante	http://cnn.com/site?str=se
41	Desirae Navarro	erat vitae risus. Duis a mi fringilla mi lacinia mattis.	https://wikipedia.org/en-us?k=0
42	Fredericka Hayes	sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis,	https://whatsapp.com/group/9?ab=441&aad=2
43	Hector Vasquez	velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod	https://wikipedia.org/en-ca?k=0
44	Brooke Gutierrez	ornare. Fusce mollis. Duis sit amet diam eu dolor egestas	http://bbc.co.uk/settings?p=8
45	Ina Bates	id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis	http://wikipedia.org/en-us?p=8
46	Bruno Brock	convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula	https://twitter.com/one?ab=441&aad=2
47	Hayes Garrison	eu tellus eu augue porttitor interdum. Sed auctor odio a	http://pinterest.com/fr?ad=115
48	Rudyard Blake	molestie. Sed id risus quis diam luctus lobortis. Class aptent	http://yahoo.com/site?str=se
49	Hermione Grimes	dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui.	https://cnn.com/group/9?q=11
50	Christine Petersen	Curabitur ut odio vel est tempor bibendum. Donec felis orci,	http://guardian.co.uk/site?q=test
51	Tatyana Clarke	hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium	https://cnn.com/en-ca?gi=100
52	Cheyenne Guy	sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula	http://netflix.com/one?q=0
53	Jana Reilly	bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum,	https://reddit.com/one?g=1
54	Kelly Case	auctor non, feugiat nec, diam. Duis mi enim, condimentum eget,	https://netflix.com/site?q=0
55	Patricia Klein	In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas.	https://facebook.com/sub?k=0
56	Sharon House	et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	http://youtube.com/en-ca?search=1
57	Edward Mcfadden	gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit	http://ebay.com/sub?g=1
58	Joel Daniel	libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus	https://pinterest.com/settings?q=0
59	Clark King	malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris	http://google.com/user/110?search=1
60	Cassandra Mayer	quis arcu vel quam dignissim pharetra. Nam ac nulla. In	https://bbc.co.uk/en-ca?ab=441&aad=2
61	Zenia Madden	lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis	https://google.com/group/9?q=test
62	Colin Valentine	volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat	https://netflix.com/en-ca?str=se
63	Nathaniel Murphy	orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit	http://naver.com/sub/cars?q=4
64	Hall Newton	dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet	https://reddit.com/en-ca?search=1&q=de
65	Chastity Harmon	consequat enim diam vel arcu. Curabitur ut odio vel est	http://youtube.com/settings?q=0
66	Maisie Stephenson	Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper	http://nytimes.com/settings?search=1
67	Giselle Woodward	in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit	https://reddit.com/sub/cars?q=11
68	Meghan Stokes	Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede,	https://twitter.com/en-us?g=1
69	Gisela Moreno	ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc	http://google.com/settings?g=1
70	Signe Carrillo	eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.	http://wikipedia.org/settings?p=8
71	Rafael Munoz	Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy	http://ebay.com/sub/cars?search=1
72	Nerea Horn	arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.	https://facebook.com/settings?ab=441&aad=2
73	Chadwick Wolf	ac orci. Ut semper pretium neque. Morbi quis urna. Nunc	https://whatsapp.com/en-us?page=1&offset=1
74	Claudia Walsh	morbi tristique senectus et netus et malesuada fames ac turpis	https://twitter.com/settings?ad=115
75	Amela Fry	malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis	https://naver.com/sub/cars?gi=100
76	Brian Knapp	a neque. Nullam ut nisi a odio semper cursus. Integer	https://facebook.com/settings?p=8
77	Rama Conley	vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat	http://whatsapp.com/one?k=0
78	Nora Myers	ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel	https://baidu.com/user/110?ad=115
79	Jakeem Crosby	non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum	https://cnn.com/sub/cars?q=4
80	Coby Calhoun	vel arcu eu odio tristique pharetra. Quisque ac libero nec	https://google.com/group/9?q=0
81	Joy Roberts	iaculis, lacus pede sagittis augue, eu tempor erat neque non	http://facebook.com/one?page=1&offset=1
82	Cassidy Rodriguez	feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare,	https://ebay.com/settings?page=1&offset=1
83	Sierra Hodge	eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut	https://facebook.com/en-ca?q=test
84	Walker Everett	at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac	http://twitter.com/one?search=1
85	Len Anthony	nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia	https://baidu.com/one?ab=441&aad=2
86	Robert Hansen	et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	http://yahoo.com/user/110?search=1
87	Simon Dominguez	eu tellus eu augue porttitor interdum. Sed auctor odio a	https://baidu.com/site?q=4
88	Ignatius Chandler	ante dictum mi, ac mattis velit justo nec ante. Maecenas	https://walmart.com/user/110?search=1&q=de
89	Amal Gross	massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices	http://twitter.com/en-ca?q=11
90	Scott Colon	in sodales elit erat vitae risus. Duis a mi fringilla	http://wikipedia.org/one?k=0
91	Mariam Cruz	nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.	https://facebook.com/user/110?q=4
92	Bevis Hickman	diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.	http://naver.com/group/9?q=0
93	Donovan Golden	felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.	http://walmart.com/user/110?p=8
94	Daquan Mays	Nulla eget metus eu erat semper rutrum. Fusce dolor quam,	https://naver.com/user/110?k=0
95	Christen Hansen	magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec	https://whatsapp.com/group/9?search=1&q=de
96	Gary Terrell	convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt	https://wikipedia.org/fr?q=4
97	Kylee Mills	ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper	http://baidu.com/settings?search=1&q=de
98	Holmes Kerr	urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus	http://twitter.com/one?g=1
99	Kennedy Vasquez	aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque	http://guardian.co.uk/fr?search=1
100	Grady Roman	euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,	https://youtube.com/sub/cars?q=test
\.


--
-- Data for Name: audiobooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audiobooks (id, title, year, cover_pic_url, author_id, voice_artist_id, label_id, adults_only) FROM stdin;
1	hendrerit consectetuer,	1854	https://twitter.com/site?ab=441&aad=2	52	85	18	t
2	Suspendisse sed	1796	http://yahoo.com/group/9?q=0	23	95	4	f
3	id nunc	1822	http://twitter.com/en-us?str=se	9	86	37	t
4	elit, pharetra	2049	http://whatsapp.com/fr?gi=100	52	61	42	t
5	lorem, luctus	1884	https://pinterest.com/group/9?client=g	77	66	22	t
6	fringilla mi	1990	http://twitter.com/settings?g=1	69	68	62	t
7	semper, dui	1823	https://zoom.us/en-us?g=1	81	26	95	f
8	velit. Aliquam	1945	https://reddit.com/fr?gi=100	20	63	100	f
9	adipiscing. Mauris	2059	https://facebook.com/sub/cars?q=4	87	70	88	t
10	quis, pede.	1987	https://pinterest.com/settings?g=1	89	96	84	t
11	molestie orci	1867	http://twitter.com/settings?search=1&q=de	29	87	92	t
12	sed, est.	1858	http://pinterest.com/site?ad=115	24	64	68	f
13	non magna.	1947	https://reddit.com/user/110?q=11	3	58	37	t
14	Cum sociis	1990	http://whatsapp.com/one?ab=441&aad=2	83	2	76	t
15	primis in	2029	https://baidu.com/settings?search=1	25	73	84	t
16	nisl arcu	2036	https://walmart.com/settings?str=se	5	48	71	t
17	nunc id	1719	http://facebook.com/sub?g=1	5	93	21	f
18	scelerisque, lorem	2068	https://instagram.com/sub/cars?client=g	71	65	40	f
19	Sed nec	1819	http://yahoo.com/fr?page=1&offset=1	29	75	77	t
20	sollicitudin commodo	1911	http://naver.com/group/9?k=0	91	39	74	t
21	a purus.	1783	https://reddit.com/settings?ad=115	54	84	51	f
22	viverra. Maecenas	1991	http://google.com/group/9?page=1&offset=1	89	58	38	t
23	habitant morbi	1898	http://youtube.com/fr?q=0	30	83	11	t
24	in, cursus	1785	https://ebay.com/settings?q=test	22	16	81	t
25	libero est,	1820	http://google.com/user/110?gi=100	35	30	22	t
26	egestas ligula.	1912	https://walmart.com/sub/cars?g=1	25	88	62	t
27	vitae diam.	1900	http://pinterest.com/sub?g=1	5	53	61	t
28	a purus.	2025	https://whatsapp.com/settings?client=g	70	78	96	t
29	nunc risus	1933	http://ebay.com/one?ad=115	43	73	56	f
30	luctus et	1827	https://zoom.us/settings?p=8	92	59	99	f
31	amet, risus.	2056	https://reddit.com/sub?p=8	62	51	8	f
32	fringilla mi	1840	http://zoom.us/user/110?search=1&q=de	48	3	13	f
33	urna, nec	1853	https://whatsapp.com/en-us?p=8	91	82	17	t
34	egestas a,	1987	https://cnn.com/settings?search=1	1	15	86	f
35	Phasellus at	1960	http://baidu.com/sub?k=0	46	15	96	t
36	magna. Duis	1990	https://yahoo.com/site?str=se	6	80	37	f
37	dolor, nonummy	1865	https://guardian.co.uk/en-ca?k=0	49	15	73	f
38	mauris sagittis	1898	https://facebook.com/en-ca?p=8	9	61	35	f
39	Quisque ornare	2049	http://ebay.com/user/110?ad=115	25	13	26	t
40	mattis. Cras	1856	https://bbc.co.uk/user/110?ab=441&aad=2	8	1	76	f
41	lorem. Donec	2062	http://nytimes.com/user/110?q=4	69	35	72	f
42	purus, in	1930	https://reddit.com/sub/cars?ad=115	6	40	94	f
43	non arcu.	1872	http://naver.com/fr?str=se	37	15	44	f
44	Suspendisse tristique	1795	http://whatsapp.com/fr?q=4	31	35	81	t
45	tellus non	1767	https://naver.com/sub?p=8	2	16	76	t
46	quam a	1955	http://pinterest.com/one?search=1	95	80	32	t
47	mollis vitae,	1845	http://netflix.com/en-us?search=1&q=de	72	96	71	f
48	eget mollis	1796	http://instagram.com/site?k=0	51	79	46	f
49	ante bibendum	2062	http://pinterest.com/en-ca?gi=100	64	68	5	t
50	rhoncus. Donec	2019	https://youtube.com/en-us?g=1	65	50	62	t
51	laoreet lectus	1792	http://cnn.com/sub?search=1	23	82	2	t
52	Phasellus libero	2093	http://guardian.co.uk/sub?client=g	56	12	88	t
53	ligula. Donec	1870	http://walmart.com/en-ca?ad=115	55	64	60	t
54	egestas. Fusce	2091	https://google.com/one?page=1&offset=1	90	52	5	f
55	Aenean gravida	1856	http://twitter.com/group/9?q=test	6	48	87	t
56	fames ac	2042	https://bbc.co.uk/en-ca?p=8	20	59	44	t
57	cursus, diam	1970	http://whatsapp.com/user/110?client=g	78	86	61	f
58	blandit congue.	1708	http://instagram.com/user/110?gi=100	29	88	22	t
59	neque et	1785	https://instagram.com/one?q=4	83	71	89	f
60	Donec dignissim	1941	https://twitter.com/group/9?q=11	32	48	93	f
61	interdum. Sed	1849	https://facebook.com/en-ca?k=0	47	9	88	f
62	interdum enim	1706	https://google.com/user/110?k=0	77	53	36	f
63	Etiam laoreet,	1865	http://baidu.com/one?g=1	14	67	81	f
64	Fusce aliquam,	1894	https://bbc.co.uk/en-us?client=g	18	29	19	f
65	vitae erat	1825	http://google.com/user/110?client=g	31	67	78	f
66	ipsum sodales	1794	https://google.com/fr?ab=441&aad=2	16	48	18	f
67	eu enim.	1709	https://yahoo.com/fr?search=1&q=de	8	85	91	f
68	non enim	1781	https://instagram.com/fr?search=1	32	37	70	t
69	rutrum magna.	1813	http://google.com/fr?p=8	59	50	5	f
70	fringilla mi	1753	https://yahoo.com/fr?q=4	60	74	21	t
71	nec ligula	1769	https://zoom.us/en-ca?gi=100	71	3	33	t
72	Nunc pulvinar	1733	https://naver.com/en-ca?ad=115	60	26	67	t
73	Donec feugiat	1964	https://reddit.com/sub?g=1	77	72	70	f
74	Curabitur massa.	1758	https://ebay.com/en-ca?q=11	30	35	1	t
75	tempor augue	1908	https://pinterest.com/en-ca?search=1	57	58	72	f
76	malesuada malesuada.	1963	http://youtube.com/settings?search=1	31	88	30	f
77	enim nisl	1930	http://facebook.com/sub?gi=100	46	62	24	f
78	nulla at	1735	http://nytimes.com/sub/cars?q=4	68	35	77	t
79	pharetra ut,	2088	https://whatsapp.com/sub?ad=115	6	13	33	t
80	rhoncus id,	2060	http://instagram.com/user/110?client=g	51	53	6	f
81	nibh. Donec	2016	https://walmart.com/settings?p=8	90	38	59	t
82	non, luctus	1951	https://reddit.com/fr?k=0	37	23	16	f
83	non magna.	1786	http://walmart.com/sub/cars?g=1	33	34	37	t
84	tellus faucibus	1861	http://zoom.us/fr?k=0	65	91	78	t
85	facilisi. Sed	1782	http://yahoo.com/en-ca?q=test	95	91	30	t
86	a tortor.	2017	https://nytimes.com/one?ab=441&aad=2	31	94	63	f
87	dolor, tempus	1918	https://ebay.com/fr?client=g	71	79	56	f
88	pharetra sed,	1984	http://bbc.co.uk/sub?ad=115	74	2	98	t
89	consectetuer adipiscing	2089	https://walmart.com/user/110?search=1&q=de	33	24	36	t
90	faucibus orci	1917	https://guardian.co.uk/user/110?ad=115	37	68	67	t
91	lectus. Cum	1885	https://guardian.co.uk/sub?gi=100	86	92	77	f
92	sollicitudin commodo	1944	https://cnn.com/group/9?ad=115	8	32	97	f
93	et malesuada	1964	http://netflix.com/user/110?str=se	41	93	55	t
94	quam. Pellentesque	1707	https://cnn.com/en-us?ad=115	21	60	96	f
95	lectus. Nullam	1704	http://naver.com/group/9?client=g	71	70	22	t
96	tristique ac,	1896	https://reddit.com/settings?q=4	98	79	17	t
97	turpis nec	1986	http://naver.com/one?search=1	23	7	49	t
98	tristique ac,	1935	http://zoom.us/fr?ad=115	71	42	33	f
99	nunc, ullamcorper	1992	http://walmart.com/fr?ab=441&aad=2	43	68	3	t
100	scelerisque neque.	1952	https://bbc.co.uk/fr?gi=100	60	19	64	t
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, first_name, last_name) FROM stdin;
1	Stacey	Dyer
2	Gregory	Fowler
3	Elliott	Dale
4	Ann	Mckee
5	Gloria	Mason
6	Emerald	Dunn
7	Winter	Leach
8	Cole	Lyons
9	George	Montoya
10	Driscoll	Chan
11	Yetta	Wynn
12	Ursula	Parks
13	Craig	Soto
14	Rylee	Ward
15	Meredith	O'connor
16	Reagan	Mccarty
17	George	Tate
18	Shelly	Cortez
19	Zane	Nixon
20	Kuame	Mcgee
21	Haley	Warner
22	Craig	Dennis
23	Chiquita	Salinas
24	Francis	Vazquez
25	Erich	Kirby
26	Orla	Nolan
27	Graham	Orr
28	Wynter	Gibson
29	Rigel	Henry
30	Madison	Salas
31	Alexander	Pope
32	Noble	Holland
33	Rebekah	Hunt
34	Thaddeus	Perez
35	Britanney	Lambert
36	Vaughan	Irwin
37	Grant	Solomon
38	Richard	Atkins
39	Mohammad	Hyde
40	Shannon	Wolf
41	Jena	Hunter
42	Simon	Delacruz
43	Judah	Oneal
44	Eagan	Christensen
45	Jacob	Dorsey
46	Stuart	Franks
47	Fitzgerald	Jarvis
48	Demetria	Parsons
49	Fulton	Scott
50	Veda	Barrett
51	Vaughan	Dillard
52	Cassandra	Mcmillan
53	Abbot	Turner
54	Jael	Houston
55	Noelani	Garza
56	Zenaida	Wilkinson
57	Heather	Rodriguez
58	Kibo	Acevedo
59	Hermione	Warren
60	Winifred	Chambers
61	Abraham	Savage
62	Louis	Sloan
63	Xena	Hoffman
64	Drew	Franklin
65	Stewart	Stafford
66	Adrian	Beck
67	Remedios	Elliott
68	Alma	Barnes
69	Kaitlin	Ferguson
70	Savannah	Lawrence
71	Reed	Wilkinson
72	Melvin	Bentley
73	Maisie	Knowles
74	George	Harmon
75	Tanek	Duran
76	John	Lane
77	Flynn	Wells
78	Vladimir	Franks
79	Naomi	Douglas
80	Karina	Good
81	Ariana	Workman
82	Brandon	Navarro
83	Phelan	Zamora
84	Mallory	Crawford
85	Danielle	Mclaughlin
86	Quon	Buckner
87	Jenette	Todd
88	Tyler	Pruitt
89	Abel	Carney
90	Jackson	Good
91	Simon	Roach
92	Arden	Hicks
93	Omar	Miles
94	Jason	Zimmerman
95	Candace	Ellison
96	Adrienne	Case
97	Kareem	Middleton
98	Desirae	Cook
99	Chiquita	Joyce
100	Phyllis	Hyde
\.


--
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chapters (id, title, url, audiobook_id, uploaded_at, size, length) FROM stdin;
1	eget metus.	http://youtube.com/settings?search=1&q=de	60	2022-08-24 15:08:37	63	2.63
2	vestibulum, neque	http://baidu.com/sub/cars?k=0	71	2022-04-27 04:05:06	78	3.21
3	Praesent interdum	http://ebay.com/en-ca?g=1	51	2023-07-09 06:20:24	94	2.88
4	eleifend. Cras	https://baidu.com/sub/cars?search=1&q=de	80	2022-01-17 09:32:11	77	3.04
5	commodo ipsum.	https://cnn.com/sub?k=0	7	2023-05-03 04:12:12	3	3.05
6	in, tempus	https://naver.com/sub/cars?q=11	19	2023-01-30 11:35:39	14	3.49
7	arcu. Sed	http://nytimes.com/settings?q=4	91	2023-09-06 11:44:09	18	3.58
8	vitae sodales	http://instagram.com/en-us?q=4	93	2023-03-05 08:08:34	11	3.19
9	interdum. Nunc	http://facebook.com/settings?q=0	17	2022-07-04 22:09:59	23	3.13
10	arcu. Morbi	https://wikipedia.org/en-ca?g=1	43	2022-04-14 06:27:17	71	3.12
11	auctor. Mauris	http://reddit.com/one?ad=115	43	2022-12-22 11:54:08	19	3.22
12	eu, ligula.	http://reddit.com/group/9?str=se	1	2023-09-10 04:34:32	63	3.03
13	ligula. Nullam	http://twitter.com/en-ca?ab=441&aad=2	19	2022-07-31 05:47:48	3	3.3
14	elit pede,	https://facebook.com/sub/cars?ad=115	76	2022-08-07 17:26:16	11	2.91
15	montes, nascetur	http://bbc.co.uk/one?q=0	60	2023-07-01 20:17:11	27	2.59
16	arcu iaculis	https://bbc.co.uk/sub/cars?ad=115	32	2022-03-08 01:39:38	84	3.41
17	aliquet odio.	http://nytimes.com/site?q=4	46	2022-04-25 08:09:03	39	3.05
18	nec urna	http://pinterest.com/en-us?ab=441&aad=2	82	2022-05-02 23:17:27	26	3.28
19	ornare tortor	https://netflix.com/group/9?search=1&q=de	41	2023-10-18 07:44:48	34	3.08
20	enim consequat	http://naver.com/sub?page=1&offset=1	12	2023-07-09 20:33:42	15	3.48
21	orci. Ut	https://reddit.com/sub?page=1&offset=1	23	2023-04-12 10:54:59	7	2.83
22	pede. Praesent	http://twitter.com/en-us?q=test	91	2023-07-23 14:51:15	100	2.93
23	Quisque imperdiet,	https://walmart.com/one?q=test	29	2022-06-15 03:29:27	6	3.24
24	Donec vitae	http://youtube.com/en-ca?ab=441&aad=2	88	2023-08-22 17:22:50	70	3
25	Phasellus dolor	https://whatsapp.com/user/110?gi=100	74	2022-04-09 02:16:29	95	2.88
26	dis parturient	https://baidu.com/one?str=se	81	2023-08-09 04:56:15	52	3.59
27	nibh lacinia	https://walmart.com/site?client=g	74	2022-07-26 19:24:07	51	3
28	fermentum vel,	http://reddit.com/group/9?str=seth	68	2022-01-10 06:45:45	82	2.75
29	dictum mi,	http://zoom.us/en-us?str=se	42	2023-09-09 14:33:39	31	2.53
30	facilisis eget,	https://naver.com/en-us?str=se	72	2023-08-15 21:20:32	16	2.71
31	augue. Sed	https://reddit.com/one?p=8	30	2023-07-15 16:30:31	4	3.05
32	purus ac	https://zoom.us/settings?ad=115	13	2023-07-25 20:05:06	53	3.21
33	Cras dictum	https://zoom.us/fr?q=4	9	2023-07-02 04:53:15	41	2.92
34	purus. Nullam	http://twitter.com/sub/cars?client=g	90	2023-08-13 04:27:45	24	2.7
35	amet diam	http://wikipedia.org/fr?q=4	57	2023-05-06 18:16:27	11	2.55
36	lacus. Nulla	http://pinterest.com/en-us?str=se	48	2023-01-29 02:15:52	91	2.93
37	sapien. Nunc	https://naver.com/settings?ab=441&aad=2	86	2023-12-08 00:34:29	62	2.96
38	ante ipsum	http://cnn.com/group/9?q=test	21	2023-09-10 04:11:59	66	3.16
39	risus quis	http://cnn.com/fr?p=8	7	2023-08-20 06:49:48	97	3.07
40	mauris ut	http://reddit.com/sub/cars?search=1	8	2023-11-02 13:04:43	8	3.37
41	metus eu	https://walmart.com/one?gi=100	31	2022-01-24 22:05:33	62	3.19
42	imperdiet ullamcorper.	https://zoom.us/en-us?q=0	35	2023-06-08 11:22:03	28	3.23
43	adipiscing fringilla,	https://yahoo.com/fr?q=test	96	2022-05-02 06:56:46	78	2.93
44	amet luctus	https://baidu.com/en-ca?q=4	92	2023-09-17 00:13:51	13	2.96
45	ultrices a,	https://walmart.com/en-us?q=test	97	2023-06-30 15:30:08	19	2.56
46	Donec dignissim	https://nytimes.com/en-us?k=0	57	2023-07-25 22:16:38	39	3.18
47	Maecenas malesuada	https://google.com/en-ca?str=se	7	2023-06-14 11:20:09	66	3.08
48	Donec dignissim	https://guardian.co.uk/settings?q=4	49	2023-04-10 15:32:17	61	3.3
49	Suspendisse sed	https://bbc.co.uk/fr?search=1&q=de	38	2023-04-08 15:18:21	61	2.9
50	non, feugiat	http://instagram.com/settings?q=4	13	2023-04-01 08:42:42	1	2.91
51	augue eu	https://instagram.com/sub?str=se	6	2023-12-12 06:34:07	17	2.53
52	lectus justo	http://zoom.us/en-ca?ab=441&aad=2	86	2022-09-27 00:08:56	50	3.25
53	velit dui,	https://guardian.co.uk/one?page=1&offset=1	76	2022-09-09 18:59:09	25	2.66
54	arcu. Vestibulum	https://pinterest.com/sub?ab=441&aad=2	64	2022-06-01 11:04:40	88	2.76
55	mattis. Integer	http://reddit.com/group/9?q=11	94	2022-08-31 19:18:35	45	3.13
56	a felis	https://netflix.com/group/9?gi=100	2	2022-02-06 00:06:15	39	3.15
57	erat. Sed	https://bbc.co.uk/user/110?q=test	90	2022-05-30 10:30:14	98	3.7
58	dis parturient	https://yahoo.com/settings?search=1&q=de	7	2023-04-15 02:36:23	25	2.68
59	vel pede	https://naver.com/sub/cars?q=test	80	2022-03-26 21:32:36	100	3.19
60	Phasellus dapibus	https://reddit.com/en-us?search=1&q=de	93	2023-07-24 21:01:46	58	3.2
61	lacus. Quisque	https://facebook.com/fr?p=8	57	2023-06-17 00:27:05	49	3.39
62	malesuada fames	https://ebay.com/one?client=g	77	2022-10-29 12:52:04	8	2.38
63	dignissim lacus.	http://yahoo.com/site?search=1&q=de	100	2023-10-22 09:25:18	23	3.08
64	lacus. Etiam	http://yahoo.com/fr?q=4	56	2023-11-08 19:03:39	40	2.68
65	porta elit,	https://naver.com/en-ca?ad=115	51	2022-05-14 22:35:38	43	2.68
66	orci sem	https://yahoo.com/site?str=se	52	2022-04-01 13:17:55	94	2.84
67	diam dictum	http://naver.com/settings?search=1&q=de	47	2022-08-25 06:01:10	20	2.78
68	dictum eu,	https://reddit.com/fr?search=1	37	2022-07-01 23:08:42	44	2.94
69	dictum. Proin	https://wikipedia.org/sub/cars?k=0	22	2022-08-03 12:58:02	52	2.55
70	Proin vel	https://nytimes.com/settings?ad=115	87	2022-11-04 03:23:39	8	3.11
71	neque pellentesque	https://zoom.us/en-ca?q=4	38	2022-07-03 19:52:26	62	3.12
72	enim mi	https://ebay.com/en-us?g=1	97	2022-10-06 02:29:23	100	2.79
73	ultrices. Vivamus	http://yahoo.com/site?q=0	38	2022-06-21 03:38:40	99	2.63
74	et malesuada	https://walmart.com/en-us?search=1	23	2023-04-02 07:55:13	14	3.18
75	et nunc.	https://naver.com/en-us?search=1	2	2023-10-23 09:15:27	10	3.4
76	velit. Cras	http://baidu.com/en-ca?p=8	44	2022-12-16 11:50:10	13	3.01
77	diam nunc,	https://pinterest.com/sub?ad=115	85	2022-07-28 12:33:16	58	3.22
78	feugiat metus	https://pinterest.com/fr?ad=115	10	2023-12-09 14:29:25	42	2.92
79	In scelerisque	https://google.com/sub/cars?str=se	63	2023-10-26 15:03:22	99	3.14
80	Maecenas iaculis	https://nytimes.com/sub/cars?g=1	1	2022-07-15 18:11:07	68	2.83
81	turpis egestas.	http://ebay.com/en-us?q=4	73	2023-09-16 10:21:39	73	2.8
82	dui. Fusce	http://yahoo.com/site?gi=100	31	2022-05-12 05:25:10	57	3.38
83	lorem, luctus	https://cnn.com/site?page=1&offset=1	16	2023-05-28 01:07:55	29	2.81
84	rhoncus. Donec	https://whatsapp.com/en-ca?search=1&q=de	61	2023-10-02 15:37:01	89	3.18
85	Vivamus euismod	https://naver.com/fr?str=se	99	2022-10-13 02:28:39	64	3.18
86	leo. Vivamus	http://guardian.co.uk/en-ca?g=1	35	2022-03-31 22:53:47	89	2.59
87	blandit. Nam	https://zoom.us/settings?p=8	86	2022-08-24 08:57:32	67	2.63
88	elit, pharetra	http://yahoo.com/one?client=g	64	2023-03-16 10:30:52	67	2.98
89	sociis natoque	http://yahoo.com/group/9?client=g	97	2023-12-14 04:51:07	51	2.74
90	et arcu	https://walmart.com/settings?str=se	5	2022-03-07 19:54:57	76	2.94
91	tellus justo	https://pinterest.com/one?ab=441&aad=2	77	2022-05-27 05:16:02	96	3.19
92	sit amet	https://reddit.com/one?g=1	77	2023-03-24 06:43:36	53	2.92
93	scelerisque dui.	https://cnn.com/site?q=0	68	2023-07-04 02:40:54	75	2.97
94	eget, ipsum.	http://wikipedia.org/en-us?str=se	42	2023-01-07 23:01:34	90	3.27
95	rutrum eu,	https://wikipedia.org/sub?q=4	57	2021-12-30 10:37:35	70	2.75
96	urna suscipit	https://zoom.us/en-ca?q=11	78	2022-04-11 05:57:16	53	3
97	Suspendisse dui.	http://youtube.com/fr?q=test	52	2022-12-26 23:23:48	3	3.37
98	vehicula et,	http://pinterest.com/sub?client=g	23	2022-02-25 21:58:00	28	2.67
99	Proin ultrices.	http://naver.com/site?search=1&q=de	76	2022-09-24 21:23:30	32	3.13
100	Integer id	http://yahoo.com/user/110?str=se	64	2022-02-10 00:16:37	24	2.86
\.


--
-- Data for Name: favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourites (user_id, song_id) FROM stdin;
41	82
30	19
82	96
80	41
60	25
60	53
17	98
76	91
95	33
54	66
46	95
99	57
16	29
82	92
35	5
37	97
46	56
80	21
15	66
38	93
93	40
75	5
85	34
9	100
49	47
57	16
88	74
60	50
18	38
56	70
100	40
100	72
27	33
76	85
53	5
91	93
35	29
51	33
9	42
98	80
93	32
9	81
87	14
29	17
23	51
23	22
8	33
12	87
95	92
51	42
52	43
13	58
69	56
73	99
60	26
3	74
68	93
48	7
92	12
93	51
95	73
39	79
65	89
75	71
69	53
43	60
3	6
33	88
78	8
92	4
83	57
89	84
90	73
53	6
7	98
14	8
39	62
89	63
100	5
48	46
89	31
70	55
59	86
34	27
94	93
13	44
94	4
83	9
6	12
98	63
88	3
26	56
97	97
100	84
57	13
89	46
81	97
24	74
2	50
73	65
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.labels (id, title, description) FROM stdin;
1	in	enim, sit amet ornare lectus justo eu arcu. Morbi sit
2	Mauris	Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu
3	dolor	interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh
4	lectus	non justo. Proin non massa non ante bibendum ullamcorper. Duis
5	Phasellus	diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer
6	elit	ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris
7	tincidunt	Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada
8	dapibus	libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet
9	Nullam	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus
10	nibh	tempor lorem, eget mollis lectus pede et risus. Quisque libero
11	luctus	lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc
12	pede	cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum
13	est,	pede. Cum sociis natoque penatibus et magnis dis parturient montes,
14	amet	in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla
15	arcu	vulputate, nisi sem semper erat, in consectetuer ipsum nunc id
16	enim	urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac
17	orci.	sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut
18	ipsum	ornare. Fusce mollis. Duis sit amet diam eu dolor egestas
19	lobortis	placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl.
20	fringilla	a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu
21	risus.	In condimentum. Donec at arcu. Vestibulum ante ipsum primis in
22	Phasellus	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue
23	Nulla	lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod
24	Aenean	Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id,
25	ullamcorper,	amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque,
26	et	nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet
27	mollis.	commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,
28	tortor,	Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue
29	molestie.	adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem
30	velit.	tempor lorem, eget mollis lectus pede et risus. Quisque libero
31	risus	erat semper rutrum. Fusce dolor quam, elementum at, egestas a,
32	dapibus	enim. Nunc ut erat. Sed nunc est, mollis non, cursus
33	elit,	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non
34	massa	consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque
35	Etiam	nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim.
36	id	sem mollis dui, in sodales elit erat vitae risus. Duis
37	orci	dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui.
38	ac	odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat
39	dolor	cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis
40	eu,	nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae
41	risus	fermentum risus, at fringilla purus mauris a nunc. In at
42	metus	volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat
43	a	dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu
44	porttitor	scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.
45	vel,	Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis
46	Duis	justo eu arcu. Morbi sit amet massa. Quisque porttitor eros
47	dapibus	eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce
48	magnis	eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus
49	Morbi	neque sed sem egestas blandit. Nam nulla magna, malesuada vel,
50	metus.	mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,
51	Aliquam	at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac
52	sem	tempor, est ac mattis semper, dui lectus rutrum urna, nec
53	enim	quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam
54	lobortis	Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla
55	malesuada	arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.
56	et	a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam
57	massa	velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices.
58	Fusce	hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus.
59	ultrices	parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio
60	sagittis.	neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis.
61	et	mi, ac mattis velit justo nec ante. Maecenas mi felis,
62	lectus	tellus non magna. Nam ligula elit, pretium et, rutrum non,
63	Mauris	ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,
64	blandit	elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu
65	odio,	Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros.
66	dictum	quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod
67	magna	dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque
68	erat	mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam
69	dui	fermentum risus, at fringilla purus mauris a nunc. In at
70	nulla.	erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus
71	varius.	amet nulla. Donec non justo. Proin non massa non ante
72	Praesent	elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec
73	nulla.	mollis dui, in sodales elit erat vitae risus. Duis a
74	ut	risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a
75	odio	velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,
76	Phasellus	vulputate, nisi sem semper erat, in consectetuer ipsum nunc id
77	bibendum	Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed
78	torquent	dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc
79	sit	Nulla eget metus eu erat semper rutrum. Fusce dolor quam,
80	Nam	enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula
81	urna	blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,
82	dictum	Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor,
83	pharetra	dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu
84	ultricies	Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper
85	facilisis	Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu
86	risus.	dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse
87	dui.	elit elit fermentum risus, at fringilla purus mauris a nunc.
88	consequat,	nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante
89	dignissim	Sed et libero. Proin mi. Aliquam gravida mauris ut mi.
90	vitae	nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas.
91	eros.	non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec
92	Nunc	faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum.
93	libero.	sed libero. Proin sed turpis nec mauris blandit mattis. Cras
94	felis	blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer
95	at,	Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper
96	et	fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh
97	Cras	iaculis enim, sit amet ornare lectus justo eu arcu. Morbi
98	Donec	Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed
99	diam.	et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget
100	in	pretium neque. Morbi quis urna. Nunc quis arcu vel quam
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, user_id, title, created_at) FROM stdin;
1	79	purus,	2023-10-16 10:44:43
2	82	non,	2023-01-22 10:07:58
3	61	tortor.	2023-05-09 15:09:09
4	61	urna	2023-03-05 19:34:42
5	43	vestibulum	2022-01-14 10:22:33
6	27	dolor.	2023-08-20 13:03:02
7	49	Duis	2023-11-27 22:07:25
8	10	eleifend	2022-06-14 09:51:30
9	16	libero.	2023-01-08 20:33:54
10	8	sit	2022-06-26 03:26:33
11	95	id	2022-02-24 14:18:50
12	10	non	2023-01-14 01:26:07
13	45	vulputate	2023-08-16 15:50:59
14	51	nunc,	2023-01-17 16:21:42
15	83	montes,	2022-12-11 19:43:28
16	60	molestie	2022-06-01 07:10:55
17	66	urna	2022-11-12 14:20:48
18	48	ultrices	2023-06-10 00:08:48
19	91	a	2022-05-07 10:11:34
20	20	tempus	2023-05-07 12:28:26
21	91	dolor.	2022-11-18 15:06:06
22	69	dolor	2023-01-26 04:19:52
23	47	massa.	2023-10-30 07:04:08
24	17	lacus,	2023-02-01 07:17:34
25	63	malesuada.	2023-05-27 15:08:03
26	95	commodo	2022-08-07 05:14:51
27	30	Donec	2022-11-07 03:51:29
28	13	dui.	2023-01-12 19:20:55
29	89	a	2022-09-11 04:55:08
30	37	ut	2023-02-24 15:34:08
31	33	Donec	2023-04-13 17:32:14
32	35	metus.	2023-03-10 08:12:27
33	59	quis	2023-01-29 06:39:04
34	4	arcu.	2022-03-29 01:13:51
35	66	sem	2022-06-23 19:39:31
36	65	tristique	2023-05-19 21:59:42
37	47	Duis	2022-08-23 18:28:23
38	84	ut	2022-10-03 02:52:17
39	27	fermentum	2023-09-20 19:52:28
40	19	risus.	2022-05-29 19:22:00
41	82	pellentesque.	2022-05-21 15:08:10
42	58	Nulla	2023-06-21 21:10:20
43	96	cubilia	2023-06-16 01:14:31
44	99	sapien,	2023-11-11 05:22:32
45	75	mi.	2023-09-29 20:59:55
46	76	dui	2022-10-19 15:52:18
47	28	Nunc	2022-09-07 19:19:06
48	76	mauris	2022-04-16 20:45:52
49	61	turpis	2023-03-27 19:37:13
50	67	quis,	2022-05-12 15:21:54
51	63	imperdiet	2023-11-25 03:30:13
52	98	convallis	2022-09-08 04:36:42
53	30	lectus	2022-03-05 12:48:45
54	88	In	2023-11-26 16:08:56
55	3	ut	2023-05-31 13:45:31
56	81	fringilla	2023-12-15 09:30:49
57	37	ante.	2022-11-14 16:50:56
58	27	diam	2022-10-31 20:48:07
59	33	penatibus	2023-03-11 01:50:46
60	86	tellus	2022-11-20 02:33:29
61	74	ipsum	2022-11-27 17:23:26
62	55	varius	2023-05-05 13:27:07
63	38	arcu	2022-07-11 20:44:51
64	95	ornare	2023-03-22 22:25:32
65	61	pharetra.	2023-05-23 04:44:05
66	79	nec,	2023-10-17 06:14:56
67	85	quis	2023-04-09 22:12:56
68	16	Nulla	2022-03-31 07:41:50
69	18	arcu.	2022-08-21 17:38:03
70	65	diam.	2022-03-14 01:38:14
71	2	metus.	2021-12-28 07:45:09
72	19	faucibus	2023-03-07 16:41:23
73	86	fringilla	2023-02-18 10:08:10
74	39	orci,	2022-02-28 08:45:09
75	7	mattis.	2023-07-27 03:59:09
76	85	pede	2023-02-06 21:30:57
77	2	vestibulum,	2023-10-15 17:33:07
78	62	nibh.	2023-08-06 10:02:27
79	49	nascetur	2023-07-01 01:57:00
80	76	Aliquam	2023-01-10 18:43:12
81	21	in,	2021-12-31 07:28:41
82	34	orci,	2022-05-12 02:52:32
83	52	Pellentesque	2022-10-10 11:49:25
84	18	purus	2022-08-21 14:59:18
85	80	sed,	2022-04-18 16:51:23
86	35	vestibulum.	2023-07-30 09:56:42
87	79	dui	2022-12-07 05:08:40
88	73	nascetur	2023-08-14 12:14:32
89	97	Proin	2022-08-29 18:39:58
90	34	adipiscing,	2023-10-06 16:54:48
91	92	Proin	2023-07-06 03:57:00
92	10	libero	2023-02-21 00:21:28
93	70	Suspendisse	2022-05-03 22:32:42
94	92	orci	2022-06-05 02:20:38
95	3	sit	2023-12-10 12:55:51
96	96	eu	2023-09-01 15:57:13
97	96	sit	2022-01-27 06:34:57
98	42	penatibus	2023-12-14 17:47:25
99	69	In	2023-10-27 00:32:48
100	18	turpis.	2022-12-26 21:17:58
\.


--
-- Data for Name: playlists_songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists_songs (playlist_id, song_id) FROM stdin;
48	42
93	40
45	28
94	48
36	66
79	79
45	29
92	55
38	35
20	92
96	42
56	46
26	44
95	27
29	89
10	26
16	95
59	97
94	90
75	94
5	83
58	43
17	24
41	60
92	49
58	8
35	46
16	85
26	36
4	70
76	13
91	28
6	48
58	18
20	2
31	71
42	82
12	79
50	10
40	18
81	22
91	16
78	13
53	46
91	12
44	20
90	78
8	43
56	70
57	8
82	34
37	14
72	22
15	26
8	45
10	35
9	42
71	5
82	39
61	47
15	5
77	15
8	75
29	5
87	60
89	47
72	82
29	61
91	79
5	80
99	47
59	45
87	33
44	44
83	65
55	54
47	37
36	15
16	15
31	51
34	3
84	20
48	51
9	97
14	42
21	8
96	19
73	39
53	47
58	17
55	10
95	59
15	62
17	67
64	89
50	84
83	72
40	79
73	52
50	86
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (user_id, profile_pic_url, created_at, is_adult) FROM stdin;
1	http://whatsapp.com/settings?q=11	2023-12-16 20:50:21	t
2	http://ebay.com/site?k=0	2022-10-26 03:00:47	t
3	http://whatsapp.com/en-ca?page=1&offset=1	2022-07-18 14:53:16	t
4	https://walmart.com/fr?q=4	2022-05-07 06:58:43	t
5	http://cnn.com/settings?client=g	2023-03-01 07:26:39	t
6	http://zoom.us/sub?ad=115	2022-10-06 17:59:27	f
7	https://facebook.com/en-ca?gi=100	2022-09-06 10:35:35	t
8	http://pinterest.com/en-us?str=se	2023-05-22 21:34:58	f
9	https://google.com/en-us?p=8	2023-04-17 20:05:35	t
10	http://ebay.com/sub/cars?q=4	2022-02-15 11:52:01	t
11	https://guardian.co.uk/en-us?gi=100	2022-02-15 03:35:32	t
12	https://instagram.com/one?search=1&q=de	2022-07-06 00:17:42	t
13	http://guardian.co.uk/one?client=g	2022-07-27 14:18:28	t
14	http://nytimes.com/one?client=g	2023-02-08 01:37:58	t
15	http://twitter.com/sub/cars?g=1	2023-03-26 21:48:06	t
16	http://cnn.com/en-us?ad=115	2022-11-09 09:38:41	t
17	http://wikipedia.org/settings?q=test	2023-09-22 06:19:03	t
18	https://cnn.com/en-ca?q=test	2022-08-17 04:11:10	f
19	http://cnn.com/group/9?search=1	2023-05-07 14:13:47	t
20	https://google.com/fr?g=1	2023-03-07 18:21:50	t
21	https://yahoo.com/sub/cars?str=se	2022-01-22 02:26:44	t
22	https://ebay.com/fr?client=g	2022-01-30 23:58:19	f
23	https://baidu.com/fr?q=11	2023-12-25 08:33:55	t
24	http://twitter.com/one?q=test	2022-04-19 21:53:05	t
25	https://reddit.com/sub?q=0	2022-10-24 05:08:18	t
26	https://walmart.com/en-ca?q=4	2022-11-14 04:37:14	t
27	http://google.com/en-ca?g=1	2023-02-23 11:27:16	t
28	http://bbc.co.uk/settings?g=1	2023-03-13 00:19:08	f
29	http://walmart.com/en-us?k=0	2022-05-03 01:56:30	t
30	https://pinterest.com/sub?client=g	2022-10-05 03:08:19	t
31	https://ebay.com/one?q=4	2023-03-12 18:48:16	t
32	http://baidu.com/user/110?page=1&offset=1	2023-01-31 06:16:54	t
33	https://whatsapp.com/user/110?page=1&offset=1	2022-11-17 12:53:08	t
34	https://whatsapp.com/en-ca?q=4	2023-06-17 17:50:05	t
35	https://ebay.com/sub?g=1	2022-06-22 23:44:49	t
36	https://zoom.us/site?p=8	2023-02-19 15:30:50	t
37	https://pinterest.com/sub/cars?q=test	2022-11-29 18:21:17	t
38	http://google.com/site?client=g	2022-07-17 10:30:38	t
39	http://whatsapp.com/sub?ad=115	2023-06-19 19:14:58	t
40	https://instagram.com/settings?k=0	2022-02-10 01:40:25	t
41	http://whatsapp.com/user/110?q=4	2022-10-18 21:56:19	t
42	http://zoom.us/one?q=4	2022-09-18 11:17:30	t
43	https://naver.com/fr?q=0	2023-11-03 04:08:40	t
44	http://facebook.com/group/9?q=test	2022-08-16 23:41:42	t
45	https://reddit.com/one?q=test	2022-05-28 17:45:09	t
46	http://nytimes.com/group/9?q=4	2022-06-21 15:02:54	t
47	http://pinterest.com/one?search=1	2023-09-23 20:00:10	t
48	http://naver.com/one?g=1	2023-03-13 01:51:33	t
49	http://wikipedia.org/sub/cars?str=se	2023-07-30 23:59:16	t
50	http://google.com/fr?q=4	2023-10-17 22:05:24	t
51	http://google.com/sub/cars?ab=441&aad=2	2023-04-04 18:22:41	t
52	http://guardian.co.uk/one?gi=100	2023-05-23 03:32:56	t
53	http://zoom.us/sub?q=test	2022-06-25 16:22:50	t
54	http://facebook.com/one?q=4	2022-09-27 11:36:05	t
55	https://baidu.com/en-us?q=0	2023-02-01 21:22:26	t
56	http://instagram.com/fr?q=test	2023-11-17 01:17:36	t
57	http://ebay.com/group/9?q=test	2022-03-28 09:25:02	t
58	https://ebay.com/en-us?search=1	2022-06-04 22:21:24	t
59	http://google.com/sub?search=1&q=de	2023-07-07 11:59:54	t
60	https://nytimes.com/en-ca?ab=441&aad=2	2022-05-27 23:41:52	t
61	https://instagram.com/settings?q=0	2023-07-18 14:35:42	t
62	http://reddit.com/one?g=1	2023-03-19 15:02:03	t
63	http://whatsapp.com/sub/cars?g=1	2023-02-03 16:42:07	t
64	https://whatsapp.com/sub?client=g	2022-01-27 15:33:52	t
66	https://walmart.com/en-us?p=8	2023-03-24 01:47:16	t
67	http://wikipedia.org/sub?search=1	2022-03-23 00:22:57	t
68	https://wikipedia.org/one?gi=100	2023-10-23 23:37:31	t
69	https://naver.com/en-ca?gi=100	2022-12-26 08:09:01	t
70	https://naver.com/settings?g=1	2023-11-19 00:49:12	t
71	http://naver.com/site?p=8	2023-08-07 16:54:40	t
72	http://wikipedia.org/site?q=4	2023-07-08 13:06:14	t
73	https://youtube.com/site?ad=115	2022-08-17 20:46:10	t
74	https://walmart.com/sub/cars?q=4	2022-11-13 01:29:25	t
75	http://cnn.com/site?k=0	2022-01-09 14:00:41	t
76	http://google.com/sub?str=se	2022-02-06 09:40:06	t
77	http://youtube.com/fr?str=se	2023-03-10 03:02:13	t
78	https://naver.com/user/110?search=1	2022-08-25 00:39:46	t
79	http://whatsapp.com/one?search=1&q=de	2022-06-14 15:23:26	t
80	http://whatsapp.com/en-us?g=1	2023-04-07 18:59:43	t
81	https://ebay.com/one?q=test	2022-07-07 18:00:32	t
82	https://yahoo.com/site?ad=115	2023-10-21 04:25:36	t
83	https://ebay.com/en-us?q=4	2023-07-17 02:08:38	t
84	https://walmart.com/site?page=1&offset=1	2023-04-11 13:50:14	t
85	http://facebook.com/en-us?search=1	2022-08-14 08:34:49	f
86	https://guardian.co.uk/sub/cars?client=g	2022-05-12 12:43:39	t
87	http://walmart.com/sub?q=11	2023-07-19 22:33:51	t
88	http://baidu.com/sub?ad=115	2022-01-31 06:10:51	t
89	http://walmart.com/settings?k=0	2022-04-06 13:02:52	t
90	https://baidu.com/one?q=0	2023-07-23 11:03:50	t
91	https://guardian.co.uk/fr?ab=441&aad=2	2023-06-22 22:48:26	t
92	http://reddit.com/user/110?q=11	2023-05-17 18:47:14	t
93	https://reddit.com/user/110?page=1&offset=1	2022-01-25 06:37:45	t
94	http://nytimes.com/one?q=test	2023-09-22 07:46:15	f
95	https://pinterest.com/settings?str=se	2022-01-20 06:29:09	t
96	http://wikipedia.org/sub?q=11	2022-03-04 12:59:28	t
97	https://wikipedia.org/user/110?client=g	2022-01-09 19:39:17	t
98	https://zoom.us/one?ab=441&aad=2	2023-03-08 12:07:58	t
99	http://instagram.com/site?q=11	2022-02-12 21:32:48	t
100	https://whatsapp.com/site?ab=441&aad=2	2022-12-08 20:56:17	t
65	https://whatsapp.com/site?ab=551&aad=29	2022-12-08 20:56:17	f
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, title, url, artist_id, album_id, uploaded_at, size, length) FROM stdin;
1	elit,	https://twitter.com/group/9?page=1&offset=1	89	7	2022-03-18 04:42:35	71	1.96
2	non	http://ebay.com/site?q=test	86	93	2023-08-31 06:54:40	43	3.31
3	aliquam	http://facebook.com/one?k=0	78	66	2023-09-05 09:43:25	98	2.19
4	dolor	http://bbc.co.uk/group/9?gi=100	34	47	2023-01-18 00:29:06	22	1.68
5	Vestibulum	https://naver.com/sub/cars?k=0	26	16	2022-11-09 04:14:23	64	2.09
6	purus,	http://netflix.com/one?k=0	40	91	2022-05-05 15:24:43	22	1.01
7	lacus.	http://google.com/sub/cars?q=0	95	35	2023-10-08 13:30:07	64	2.66
8	Nulla	https://reddit.com/user/110?page=1&offset=1	95	5	2022-02-05 10:10:05	18	2.7
9	mi.	https://zoom.us/settings?page=1&offset=1	22	70	2023-03-07 00:24:23	45	2.52
10	tincidunt	http://ebay.com/one?str=se	59	91	2023-11-05 04:09:23	49	1.39
11	augue	http://baidu.com/user/110?client=g	46	94	2023-03-31 20:47:29	52	1.3
12	imperdiet	https://netflix.com/en-us?search=1&q=de	13	89	2022-05-02 12:51:25	30	1.3
13	Nam	http://wikipedia.org/sub?p=8	74	49	2023-02-19 04:59:02	60	1.61
14	eu	https://naver.com/en-us?p=8	92	17	2023-04-04 09:00:06	88	2.07
15	id	https://baidu.com/site?p=8	74	99	2022-10-09 17:41:18	19	2.63
16	tellus.	http://baidu.com/one?k=0	48	92	2023-07-07 13:03:04	66	1.46
17	Aenean	http://pinterest.com/en-ca?client=g	52	10	2023-07-10 15:52:41	31	1.79
18	libero	https://baidu.com/one?client=g	46	68	2022-05-05 13:03:08	35	1.01
19	ut	https://walmart.com/en-us?k=0	94	60	2023-11-23 21:38:18	16	2.63
20	Etiam	https://yahoo.com/settings?ab=441&aad=2	84	7	2023-08-01 16:01:06	17	2.56
21	Cras	http://facebook.com/settings?k=0	15	34	2023-06-02 12:47:36	30	1.26
22	elit.	https://google.com/sub/cars?str=se	51	9	2022-07-23 10:53:41	99	3.12
23	rhoncus.	https://twitter.com/sub/cars?str=se	72	4	2023-01-14 17:32:02	11	2.43
24	pharetra.	https://naver.com/one?client=g	38	24	2023-10-18 04:25:39	82	2.5
25	eu	https://youtube.com/user/110?ad=115	3	90	2022-09-05 01:45:14	61	2.67
26	parturient	http://guardian.co.uk/sub?gi=100	25	62	2022-12-12 00:34:15	29	1.78
27	Vivamus	https://guardian.co.uk/sub?search=1&q=de	86	96	2022-01-06 19:14:01	4	2.19
28	augue	https://yahoo.com/group/9?ab=441&aad=2	98	30	2023-08-14 21:26:13	22	0.53
29	natoque	http://wikipedia.org/sub?search=1&q=de	82	41	2023-01-13 21:36:30	54	1.28
30	dui,	http://nytimes.com/settings?client=g	97	26	2022-11-23 09:22:51	42	2.33
31	leo	https://cnn.com/sub/cars?q=11	27	44	2022-10-13 11:44:26	39	2.31
32	Nunc	http://naver.com/site?g=1	70	70	2022-12-31 13:43:14	53	2.14
33	et	https://nytimes.com/en-us?search=1&q=de	52	6	2023-07-30 20:55:25	94	1.79
34	vitae,	http://pinterest.com/user/110?q=test	3	63	2023-04-07 04:08:11	50	1.73
35	blandit.	https://yahoo.com/fr?search=1	36	34	2023-07-18 09:00:22	55	1.77
36	Ut	http://reddit.com/fr?page=1&offset=1	21	77	2022-08-16 14:15:35	40	1.89
37	ipsum.	http://baidu.com/sub/cars?q=4	95	81	2022-03-25 07:34:15	27	2.02
38	sollicitudin	https://walmart.com/one?ab=441&aad=2	64	17	2022-01-30 15:51:25	24	2.9
39	eu	https://google.com/fr?k=0	48	99	2022-12-13 14:18:22	35	1.91
40	ullamcorper,	https://zoom.us/sub?q=test	89	86	2023-06-08 01:55:22	80	2.09
41	ipsum.	http://zoom.us/en-ca?gi=100	89	42	2022-08-10 05:04:06	58	1.31
42	Lorem	https://facebook.com/fr?search=1&q=de	7	87	2022-04-23 20:06:39	55	3.02
43	pharetra.	http://pinterest.com/sub/cars?p=8	82	14	2023-11-14 06:25:35	4	3.29
44	consequat	http://cnn.com/user/110?client=g	97	56	2023-04-13 12:00:01	59	1.54
45	dis	http://yahoo.com/user/110?search=1	17	60	2022-12-31 14:57:24	47	1.91
46	sit	http://cnn.com/site?q=11	40	30	2023-08-13 11:19:59	45	2.92
47	commodo	http://instagram.com/settings?client=g	50	57	2022-11-04 19:34:08	3	2.24
48	metus.	http://nytimes.com/fr?q=4	50	8	2023-07-28 14:56:16	33	2.04
49	risus	http://twitter.com/sub/cars?gi=100	39	77	2022-01-11 02:53:43	80	2.12
50	convallis	https://cnn.com/fr?search=1	19	18	2023-08-11 06:56:15	69	1.71
51	nulla	http://google.com/sub?g=1	78	39	2023-09-17 04:37:46	24	0.44
52	non	http://reddit.com/user/110?k=0	63	7	2023-03-15 05:35:24	12	3.14
53	mollis.	http://walmart.com/site?str=se	35	90	2023-05-04 06:24:39	84	2.13
54	vitae	https://instagram.com/en-ca?search=1	56	49	2023-01-08 14:01:08	80	1.84
55	et,	http://naver.com/one?q=4	31	36	2023-10-05 02:00:02	19	1.43
56	a	https://twitter.com/fr?g=1	48	59	2022-04-14 06:22:28	64	1.43
57	ante	http://whatsapp.com/sub/cars?str=se	71	48	2023-12-21 22:26:26	78	2.6
58	sem,	http://reddit.com/one?ad=115	15	45	2022-07-02 03:06:40	51	2.28
59	pede,	https://guardian.co.uk/en-ca?search=1&q=de	100	55	2022-12-13 10:49:43	34	1.59
60	orci,	http://whatsapp.com/one?ad=115	56	23	2023-10-03 02:13:02	100	3.04
61	lacinia	https://wikipedia.org/en-ca?g=1	36	40	2022-05-27 19:27:58	59	1.74
62	pharetra	http://pinterest.com/site?q=test	45	17	2022-01-16 18:59:07	18	1.86
63	iaculis,	http://walmart.com/fr?q=11	78	34	2022-11-22 21:45:08	78	0.97
64	Phasellus	https://bbc.co.uk/sub/cars?q=4	84	3	2022-04-20 21:00:31	75	2.25
65	eu	http://youtube.com/site?k=0	72	45	2022-09-09 01:31:30	48	1.29
66	vestibulum	http://netflix.com/settings?str=se	42	49	2022-01-29 05:54:47	38	2.01
67	neque.	http://youtube.com/site?q=4	64	48	2022-11-10 06:33:40	83	2.46
68	leo.	https://zoom.us/user/110?ab=441&aad=2	31	58	2022-01-20 08:25:42	61	2.38
69	eu	http://baidu.com/site?ad=115	99	4	2022-11-23 13:16:53	52	1.18
70	leo.	https://netflix.com/group/9?q=0	19	89	2023-12-19 22:43:34	85	1.82
71	elementum,	https://instagram.com/fr?client=g	99	25	2023-01-23 04:26:32	38	1.55
72	pharetra.	https://ebay.com/en-ca?client=g	67	80	2022-01-26 22:27:04	59	2.12
73	sed	https://guardian.co.uk/one?q=4	27	36	2023-06-19 14:38:27	29	0.96
74	quam.	http://baidu.com/sub?q=4	8	30	2022-02-21 16:11:53	57	1.88
75	facilisis	https://wikipedia.org/en-ca?client=g	62	92	2023-04-17 19:22:42	53	2.36
76	non	https://guardian.co.uk/en-ca?client=g	24	35	2022-02-16 08:17:19	99	2.72
77	interdum	http://walmart.com/one?ad=115	74	80	2023-11-29 21:59:29	100	3.27
78	commodo	https://bbc.co.uk/sub/cars?q=test	92	38	2023-07-31 22:01:47	77	1.95
79	eros.	https://yahoo.com/sub?g=1	98	51	2023-10-12 18:11:30	9	2.85
80	nunc	https://wikipedia.org/user/110?q=0	67	99	2023-10-13 05:48:55	13	1.53
81	parturient	https://zoom.us/sub?page=1&offset=1	2	15	2023-11-11 14:17:17	78	2.58
82	tincidunt	https://guardian.co.uk/en-us?page=1&offset=1	9	63	2022-07-04 05:26:20	60	2.5
83	hendrerit	http://guardian.co.uk/sub/cars?search=1&q=de	4	81	2023-06-28 15:51:19	19	2.15
84	porttitor	https://whatsapp.com/one?q=11	47	91	2022-04-03 12:00:59	97	3.11
85	eu	http://ebay.com/group/9?gi=100	57	21	2023-07-19 00:21:50	14	2.83
86	vitae	http://pinterest.com/group/9?page=1&offset=1	87	10	2022-08-09 22:34:44	49	0.84
87	dolor.	http://whatsapp.com/en-ca?search=1	27	12	2023-11-08 07:19:01	16	3.64
88	Donec	https://pinterest.com/site?q=0	70	96	2022-12-30 23:00:34	60	2.46
89	aliquam	https://facebook.com/fr?q=0	42	96	2022-02-18 20:24:40	7	1.38
90	lacinia	https://whatsapp.com/fr?client=g	42	41	2022-10-31 22:12:51	16	2.68
91	mattis.	https://ebay.com/group/9?str=se	49	96	2022-07-27 20:09:25	44	2.13
92	nonummy	https://facebook.com/user/110?ab=441&aad=2	97	60	2022-08-19 11:37:04	23	3.03
93	purus,	http://ebay.com/site?page=1&offset=1	79	66	2022-01-25 02:40:56	22	2.65
94	Suspendisse	http://facebook.com/user/110?p=8	40	63	2023-04-24 22:52:06	21	2.41
95	euismod	http://guardian.co.uk/sub?page=1&offset=1	68	22	2023-10-30 20:37:13	4	2.33
96	in	https://instagram.com/group/9?search=1	25	89	2023-11-13 13:05:47	60	1.31
97	a,	http://walmart.com/en-ca?q=0	83	98	2022-02-04 04:28:00	90	1.18
98	vitae	http://reddit.com/site?g=1	25	47	2022-04-30 06:37:40	42	1.73
99	lectus	https://baidu.com/sub?q=0	28	49	2023-09-11 08:22:31	5	2.15
100	luctus	https://instagram.com/en-ca?ab=441&aad=2	60	53	2023-01-01 20:37:21	93	1.94
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, phone) FROM stdin;
1	Warren	Mays	duis.risus.odio@icloud.com	(031465) 107941
2	Bevis	Ferrell	semper.cursus@outlook.com	(0574) 76553726
3	Uriel	Moody	commodo@aol.net	(0684) 36658587
4	Xena	Larson	id.ante@hotmail.couk	(0121) 85635638
5	Lyle	Quinn	vitae.aliquet.nec@protonmail.net	(071) 02336306
6	Gemma	Lawson	proin.sed@icloud.org	(0839) 61332164
7	Leonard	Robbins	cubilia.curae@outlook.org	(038282) 472072
8	Jaden	Franklin	sed.auctor@icloud.com	(035603) 792683
9	Vivien	Robbins	donec@hotmail.edu	(0595) 39605195
10	Cade	Donaldson	aliquam.tincidunt@icloud.org	(031035) 532346
11	Bradley	Schwartz	tempor.augue@hotmail.ca	(034001) 737146
12	Jolie	Buckley	fermentum.metus@protonmail.ca	(038377) 014573
13	Darrel	Petersen	cursus.et@yahoo.ca	(073) 77183276
14	Addison	Oliver	et.libero.proin@icloud.ca	(061) 67736738
15	Pascale	Gay	vel.quam@icloud.edu	(0432) 64893214
16	Dolan	Fernandez	malesuada.id@hotmail.org	(03727) 7881334
17	Griffin	Miranda	sed@icloud.org	(030776) 565139
18	Brady	Hodge	mollis@yahoo.couk	(073) 26655781
19	Walker	Bradley	tortor@outlook.net	(037812) 016437
20	Natalie	York	litora@outlook.org	(038263) 113761
21	Porter	Boone	sit@protonmail.couk	(032920) 868257
22	Price	Jacobson	augue@outlook.edu	(031236) 107772
23	Nyssa	Sparks	neque.nullam.nisl@outlook.couk	(03556) 5622867
24	Nathaniel	Yang	diam.at@aol.org	(0636) 24262863
25	Samuel	Vasquez	ante.nunc@protonmail.org	(028) 33762721
26	Walker	Gallagher	porttitor.scelerisque.neque@aol.com	(054) 96850591
27	Bradley	Tyson	proin.eget.odio@aol.net	(0557) 14763758
28	Karen	Douglas	fusce@icloud.ca	(026) 67957499
29	Axel	Buck	arcu@outlook.ca	(0317) 40976547
30	Rhona	King	integer@aol.org	(031709) 673347
31	Alvin	Whitney	magna@google.net	(036953) 177226
32	Kyle	Kirby	in.dolor@yahoo.net	(034141) 838136
33	Phelan	Guy	facilisis@google.net	(0551) 64762270
34	Brian	Haley	sem.semper.erat@yahoo.org	(0345) 15696513
35	Olga	Yates	cum.sociis@aol.org	(064) 53238812
36	Jeremy	Padilla	sem@yahoo.ca	(037135) 117406
37	Nasim	Jones	tempus.risus@aol.edu	(0618) 51788051
38	Asher	Collins	sit.amet@protonmail.com	(06505) 3088761
39	Brenden	Clay	odio.semper@google.ca	(036711) 851024
40	Silas	Rodriquez	dolor.fusce@protonmail.ca	(031433) 556697
41	Josephine	Doyle	nulla.cras@outlook.ca	(0072) 79182200
42	Clare	Lawson	nunc.pulvinar@protonmail.edu	(0642) 38421068
43	Jermaine	Buckner	lorem@yahoo.net	(039324) 504565
44	Jordan	Reid	dictum.phasellus@protonmail.ca	(0788) 28085453
45	Iris	Kane	nunc.ut@google.couk	(055) 73752847
46	Nigel	Cantrell	cras.pellentesque.sed@outlook.edu	(00338) 8750942
47	Alec	Sosa	magna.a.tortor@google.org	(0076) 61468923
48	Felix	Head	in.faucibus@google.ca	(041) 92713246
49	Minerva	Garner	mattis.integer@protonmail.net	(08657) 7715785
50	Angela	Sawyer	velit.justo@aol.net	(03048) 0307402
51	Leila	Kennedy	a.odio@hotmail.net	(0039) 48944385
52	Evelyn	Hernandez	enim.mauris@outlook.ca	(05138) 3817826
53	Carson	Leonard	accumsan@aol.couk	(033) 25575451
54	Ramona	Howe	et.commodo.at@hotmail.ca	(036371) 745681
55	Micah	Mccarthy	molestie.sed@aol.couk	(033858) 134023
56	Lucius	Barrera	sagittis.duis@outlook.edu	(014) 84168296
57	Aline	Pickett	dolor.dapibus@outlook.edu	(031454) 659868
58	Vance	Baxter	et@yahoo.edu	(0588) 87112728
59	Simone	Mcclure	commodo.hendrerit@yahoo.ca	(0316) 22371252
60	Hedwig	Schmidt	facilisis.vitae@icloud.edu	(0786) 13772717
61	Drake	Galloway	mattis@outlook.couk	(043) 16688150
62	Vivian	Cannon	morbi.tristique.senectus@google.org	(02237) 0861931
63	Wyatt	Morrison	mi.ac@aol.org	(031021) 269754
64	Justin	Turner	donec@protonmail.ca	(047) 56767886
65	Elmo	Witt	nunc.lectus@google.ca	(09160) 6125497
66	Joy	Church	hendrerit.consectetuer.cursus@hotmail.ca	(031446) 056851
67	Karen	Gutierrez	ac.tellus@google.ca	(031162) 181782
68	Urielle	Sampson	ligula.donec@outlook.org	(03450) 4246247
69	Knox	Woodard	pede@yahoo.org	(04527) 5363942
70	Phelan	Austin	integer.in@outlook.org	(0854) 52248417
71	Dennis	Butler	adipiscing@outlook.org	(036357) 366889
72	Barrett	Gilmore	nam@aol.net	(064) 34133546
73	William	Forbes	vivamus.nisi@google.org	(0307) 49940556
74	Ezekiel	Sandoval	odio.a@yahoo.net	(038413) 686433
75	Emerald	Weeks	nisl@protonmail.com	(0461) 93585068
76	Joy	Wilcox	urna.vivamus@hotmail.couk	(0842) 70063088
77	Linus	Compton	mollis.phasellus@google.net	(030104) 374894
78	Colton	Patterson	mauris.ut@protonmail.org	(031465) 601719
79	Murphy	Wilkinson	curabitur@yahoo.couk	(0158) 69360314
80	John	Ray	duis.volutpat@aol.com	(04009) 1159974
81	Neve	Bond	justo@outlook.org	(025) 57246665
82	Jacob	Richard	velit.aliquam@icloud.net	(0194) 42817517
83	Helen	Ferrell	dui@aol.ca	(0180) 25733731
84	Joan	Burke	eu.ligula.aenean@google.org	(085) 57250353
85	Kibo	Doyle	nullam@aol.edu	(01152) 2627250
86	Cairo	Livingston	mollis.non@hotmail.com	(076) 21047779
87	Maxine	Woodard	velit.eu.sem@google.couk	(038195) 842210
88	Hedwig	Cummings	cras.sed@aol.com	(032013) 677645
89	Leila	Flynn	pellentesque@google.couk	(093) 23886922
90	Althea	Shelton	pretium.neque.morbi@icloud.net	(0355) 45716666
91	Magee	Greene	ultrices@yahoo.ca	(05414) 0454468
92	Jessamine	Osborn	vulputate.eu@protonmail.org	(01074) 5706671
93	Britanni	Jenkins	lobortis.ultrices@aol.edu	(0557) 36878494
94	Lucian	Chang	cras.vulputate@google.ca	(02380) 6124274
95	Orli	Christian	orci.ut@google.couk	(036783) 974654
96	Mariam	Dennis	mus.proin@yahoo.org	(034238) 786230
97	Ruby	Powell	ipsum@yahoo.couk	(034724) 516792
98	Norman	Faulkner	nec.tempus@google.couk	(04683) 4251312
99	Rigel	Morrison	aliquam.tincidunt.nunc@hotmail.couk	(037) 18693701
100	Lana	Durham	auctor.nunc@aol.org	(062) 81965773
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_id_seq', 100, true);


--
-- Name: alike_artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alike_artists_id_seq', 100, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 100, true);


--
-- Name: audiobooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audiobooks_id_seq', 100, true);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 100, true);


--
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chapters_id_seq', 100, true);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.labels_id_seq', 100, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 100, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: albums albums_cover_pic_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_cover_pic_url_key UNIQUE (cover_pic_url);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: alike_artists alike_artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alike_artists
    ADD CONSTRAINT alike_artists_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: audiobooks audiobooks_cover_pic_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audiobooks
    ADD CONSTRAINT audiobooks_cover_pic_url_key UNIQUE (cover_pic_url);


--
-- Name: audiobooks audiobooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audiobooks
    ADD CONSTRAINT audiobooks_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: chapters chapters_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_url_key UNIQUE (url);


--
-- Name: favourites favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (user_id, song_id);


--
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: playlists_songs playlists_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_pkey PRIMARY KEY (playlist_id, song_id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (user_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: songs songs_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_url_key UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: albums albums_artist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fk FOREIGN KEY (artist_id) REFERENCES public.artists(id) ON DELETE CASCADE;


--
-- Name: albums albums_label_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_label_id_fk FOREIGN KEY (label_id) REFERENCES public.labels(id) ON DELETE CASCADE;


--
-- Name: alike_artists alike_artists_alike_artist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alike_artists
    ADD CONSTRAINT alike_artists_alike_artist_id_fk FOREIGN KEY (alike_artist_id) REFERENCES public.artists(id) ON DELETE CASCADE;


--
-- Name: alike_artists alike_artists_artist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alike_artists
    ADD CONSTRAINT alike_artists_artist_id_fk FOREIGN KEY (artist_id) REFERENCES public.artists(id) ON DELETE CASCADE;


--
-- Name: audiobooks audiobooks_author_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audiobooks
    ADD CONSTRAINT audiobooks_author_id_fk FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;


--
-- Name: audiobooks audiobooks_label_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audiobooks
    ADD CONSTRAINT audiobooks_label_id_fk FOREIGN KEY (label_id) REFERENCES public.labels(id) ON DELETE CASCADE;


--
-- Name: audiobooks audiobooks_voice_artist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audiobooks
    ADD CONSTRAINT audiobooks_voice_artist_id_fk FOREIGN KEY (voice_artist_id) REFERENCES public.artists(id) ON DELETE CASCADE;


--
-- Name: chapters chapters_audiobook_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_audiobook_id_fk FOREIGN KEY (audiobook_id) REFERENCES public.audiobooks(id) ON DELETE CASCADE;


--
-- Name: favourites favourites_song_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_song_id_fk FOREIGN KEY (song_id) REFERENCES public.songs(id) ON DELETE CASCADE;


--
-- Name: favourites favourites_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: playlists_songs playlists_songs_playlist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_playlist_id_fk FOREIGN KEY (playlist_id) REFERENCES public.playlists(id) ON DELETE CASCADE;


--
-- Name: playlists_songs playlists_songs_song_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_song_id_fk FOREIGN KEY (song_id) REFERENCES public.songs(id) ON DELETE CASCADE;


--
-- Name: playlists playlists_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: songs songs_album_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fk FOREIGN KEY (album_id) REFERENCES public.albums(id) ON DELETE SET NULL;


--
-- Name: songs songs_artist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fk FOREIGN KEY (artist_id) REFERENCES public.artists(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

