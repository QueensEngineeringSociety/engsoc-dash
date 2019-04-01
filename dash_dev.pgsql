--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO dash;

--
-- Name: interviews; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE interviews (
    id integer NOT NULL,
    job_application_id integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.interviews OWNER TO dash;

--
-- Name: interviews_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE interviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interviews_id_seq OWNER TO dash;

--
-- Name: interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE interviews_id_seq OWNED BY interviews.id;


--
-- Name: job_applications; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE job_applications (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    job_posting_id integer,
    status integer DEFAULT 0,
    archived boolean DEFAULT false,
    resumes_id integer
);


ALTER TABLE public.job_applications OWNER TO dash;

--
-- Name: job_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE job_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_applications_id_seq OWNER TO dash;

--
-- Name: job_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE job_applications_id_seq OWNED BY job_applications.id;


--
-- Name: job_posting_answers; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE job_posting_answers (
    id integer NOT NULL,
    content text,
    job_application_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    job_posting_questions_id integer
);


ALTER TABLE public.job_posting_answers OWNER TO dash;

--
-- Name: job_posting_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE job_posting_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_posting_answers_id_seq OWNER TO dash;

--
-- Name: job_posting_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE job_posting_answers_id_seq OWNED BY job_posting_answers.id;


--
-- Name: job_posting_questions; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE job_posting_questions (
    id integer NOT NULL,
    job_posting_id integer,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.job_posting_questions OWNER TO dash;

--
-- Name: job_posting_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE job_posting_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_posting_questions_id_seq OWNER TO dash;

--
-- Name: job_posting_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE job_posting_questions_id_seq OWNED BY job_posting_questions.id;


--
-- Name: job_postings; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE job_postings (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status integer DEFAULT 0,
    description character varying,
    deadline timestamp without time zone,
    creator_id integer,
    title character varying,
    job_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE public.job_postings OWNER TO dash;

--
-- Name: job_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE job_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_postings_id_seq OWNER TO dash;

--
-- Name: job_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE job_postings_id_seq OWNED BY job_postings.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE jobs (
    id integer NOT NULL,
    organization_id integer,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    status integer,
    role integer DEFAULT 0,
    job_type integer DEFAULT 0,
    job_posting_id integer
);


ALTER TABLE public.jobs OWNER TO dash;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO dash;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    status integer DEFAULT 0,
    description character varying,
    department integer DEFAULT 0,
    name character varying
);


ALTER TABLE public.organizations OWNER TO dash;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_id_seq OWNER TO dash;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE positions (
    id integer NOT NULL,
    job_id integer NOT NULL,
    user_id integer NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE public.positions OWNER TO dash;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO dash;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: resumes; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE resumes (
    id integer NOT NULL,
    name character varying,
    attachment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.resumes OWNER TO dash;

--
-- Name: resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE resumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resumes_id_seq OWNER TO dash;

--
-- Name: resumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE resumes_id_seq OWNED BY resumes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dash;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dash; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    phone_number character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role integer DEFAULT 0,
    student boolean DEFAULT true,
    gender integer DEFAULT 0,
    birthday timestamp without time zone,
    faculty text,
    specialization text,
    tagline text,
    bio text,
    preferred_name character varying
);


ALTER TABLE public.users OWNER TO dash;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dash
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dash;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dash
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY interviews ALTER COLUMN id SET DEFAULT nextval('interviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_applications ALTER COLUMN id SET DEFAULT nextval('job_applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_posting_answers ALTER COLUMN id SET DEFAULT nextval('job_posting_answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_posting_questions ALTER COLUMN id SET DEFAULT nextval('job_posting_questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_postings ALTER COLUMN id SET DEFAULT nextval('job_postings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY resumes ALTER COLUMN id SET DEFAULT nextval('resumes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dash
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-09-07 04:23:20.845762	2017-09-07 04:23:20.845762
\.


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY interviews (id, job_application_id, start_time, end_time, created_at, updated_at) FROM stdin;
\.


--
-- Name: interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('interviews_id_seq', 1, false);


--
-- Data for Name: job_applications; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY job_applications (id, created_at, updated_at, user_id, job_posting_id, status, archived, resumes_id) FROM stdin;
1	2017-09-07 04:23:40.684705	2017-09-07 04:23:40.684705	67	4	1	f	\N
2	2017-09-07 04:23:40.980829	2017-09-07 04:23:40.980829	68	4	1	f	\N
3	2017-09-07 04:23:41.270375	2017-09-07 04:23:41.270375	69	4	1	f	\N
4	2017-09-07 04:23:41.553542	2017-09-07 04:23:41.553542	70	4	1	f	\N
5	2017-09-07 04:23:41.832666	2017-09-07 04:23:41.832666	71	4	1	f	\N
6	2017-09-07 04:23:42.117935	2017-09-07 04:23:42.117935	72	4	1	f	\N
7	2017-09-07 04:23:42.412325	2017-09-07 04:23:42.412325	73	5	1	f	\N
8	2017-09-07 04:23:42.681685	2017-09-07 04:23:42.681685	74	5	1	f	\N
9	2017-09-07 04:23:42.932115	2017-09-07 04:23:42.932115	75	5	1	f	\N
10	2017-09-07 04:23:43.227075	2017-09-07 04:23:43.227075	76	5	1	f	\N
\.


--
-- Name: job_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('job_applications_id_seq', 10, true);


--
-- Data for Name: job_posting_answers; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY job_posting_answers (id, content, job_application_id, created_at, updated_at, job_posting_questions_id) FROM stdin;
1	Yes im java expert	1	2017-09-07 04:23:40.702982	2017-09-07 04:23:40.702982	16
2	Git master righ here	1	2017-09-07 04:23:40.706705	2017-09-07 04:23:40.706705	17
3	Been a manager	1	2017-09-07 04:23:40.709215	2017-09-07 04:23:40.709215	18
4	Uh Java isn't my strongsuit	2	2017-09-07 04:23:40.986798	2017-09-07 04:23:40.986798	16
5	Mostly SVN	2	2017-09-07 04:23:40.991936	2017-09-07 04:23:40.991936	17
6	No I don't like talking	2	2017-09-07 04:23:40.995943	2017-09-07 04:23:40.995943	18
7	Is that like coffee	3	2017-09-07 04:23:41.273555	2017-09-07 04:23:41.273555	16
8	Like version numbers?	3	2017-09-07 04:23:41.276755	2017-09-07 04:23:41.276755	17
9	Yeah for flip cup	3	2017-09-07 04:23:41.281562	2017-09-07 04:23:41.281562	18
10	Jawohl	4	2017-09-07 04:23:41.558938	2017-09-07 04:23:41.558938	16
11	Nein	4	2017-09-07 04:23:41.56299	2017-09-07 04:23:41.56299	17
12	For the reich	4	2017-09-07 04:23:41.566755	2017-09-07 04:23:41.566755	18
13	Haha I invented it	5	2017-09-07 04:23:41.835974	2017-09-07 04:23:41.835974	16
14	Yeah anything you can throw at me	5	2017-09-07 04:23:41.844837	2017-09-07 04:23:41.844837	17
15	I'm kind of a dick	5	2017-09-07 04:23:41.851015	2017-09-07 04:23:41.851015	18
16	Too easy	6	2017-09-07 04:23:42.121904	2017-09-07 04:23:42.121904	16
17	Yes, it's crucial	6	2017-09-07 04:23:42.125012	2017-09-07 04:23:42.125012	17
18	I used to be pretty bad at it but I'm getting the hang of it now	6	2017-09-07 04:23:42.128571	2017-09-07 04:23:42.128571	18
19	Yes from my econ classes	7	2017-09-07 04:23:42.415119	2017-09-07 04:23:42.415119	19
20	From a poker tournament	7	2017-09-07 04:23:42.419062	2017-09-07 04:23:42.419062	20
21	Yee whacha sayin b'y	7	2017-09-07 04:23:42.42301	2017-09-07 04:23:42.42301	21
22	No just pen and paper for me	8	2017-09-07 04:23:42.685337	2017-09-07 04:23:42.685337	19
23	From a poker tournament	8	2017-09-07 04:23:42.689095	2017-09-07 04:23:42.689095	20
24	I'm actually insane	8	2017-09-07 04:23:42.691672	2017-09-07 04:23:42.691672	21
25	Virgo paens cattus avarus clementia. Aeternus correptius repudiandae curriculum. Convoco dens quisquam. Crux ut numquam toties. Adfectus vomito unde pecto et. Terga cupiditate cogito clibanus.	9	2017-09-07 04:23:42.939186	2017-09-07 04:23:42.939186	19
26	Colligo cupio vel ulterius commodi aestus. Sint deserunt vobis cum currus subseco nemo. Aggredior suffragium at cerno utique aqua carcer volva. Repellat inventore voluptates quia minus curiositas aut iusto. Adeptio centum calculus. Cometes aranea vestrum demoror communis canis subvenio vita.	9	2017-09-07 04:23:42.944109	2017-09-07 04:23:42.944109	20
27	Consectetur stultus quas debitis vir. Decerno voluptatem provident adeo itaque cruentus valetudo. Sonitus dignissimos provident nemo adinventitias tantillus optio ad. Repudiandae vigilo doloribus caput valens voluptatem minus. Umerus ullus tabernus vel videlicet tepidus vapulus deleniti.	9	2017-09-07 04:23:42.948807	2017-09-07 04:23:42.948807	21
28	Amor vere corrigo voluptatum aegrotatio. Uter officiis carcer culpa vigor agnitio vomito. Sint apostolus tumultus laboriosam. Contigo alius decretum virga commodi curto. Aestivus abundans voro cornu ulciscor pecus.	10	2017-09-07 04:23:43.232959	2017-09-07 04:23:43.232959	19
29	Aggredior sit vinum color aperiam. Cohors cado copia triumphus ut copiose tutis bestia. Peior rerum teneo magnam curiositas inflammatio arbustum. Eos rerum aegrus virgo quos benevolentia acerbitas.	10	2017-09-07 04:23:43.240278	2017-09-07 04:23:43.240278	20
30	Vulpes eveniet temeritas. Et laborum impedit aufero copiose. Thorax acer textus quis labore vitae uxor. Vesco synagoga theca. Amitto sto advenio coniuratio alienus universe auxilium. Qui comptus cognatus.	10	2017-09-07 04:23:43.245604	2017-09-07 04:23:43.245604	21
\.


--
-- Name: job_posting_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('job_posting_answers_id_seq', 30, true);


--
-- Data for Name: job_posting_questions; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY job_posting_questions (id, job_posting_id, content, created_at, updated_at) FROM stdin;
1	1	Are you good at calculations and finances?	2017-09-07 04:23:38.673374	2017-09-07 04:23:38.673374
2	1	What department are you in?	2017-09-07 04:23:38.67888	2017-09-07 04:23:38.67888
3	1	How do you plan to raise money for QGEC?	2017-09-07 04:23:38.681496	2017-09-07 04:23:38.681496
4	1	What books have you read in the last month?	2017-09-07 04:23:38.684171	2017-09-07 04:23:38.684171
5	1	What time and date can you interview?	2017-09-07 04:23:38.68752	2017-09-07 04:23:38.68752
6	2	Are you comfortable talking to strangers?	2017-09-07 04:23:38.997409	2017-09-07 04:23:38.997409
7	2	What are your favorite companies?	2017-09-07 04:23:39.003208	2017-09-07 04:23:39.003208
8	2	What are some other positions you're interested in within QGEC? They include head of IT, head of sponsorship, events coordinator, lead marketer, and more	2017-09-07 04:23:39.006939	2017-09-07 04:23:39.006939
9	2	What books have you read in the last month?	2017-09-07 04:23:39.011056	2017-09-07 04:23:39.011056
10	2	What time and date can you interview?	2017-09-07 04:23:39.015611	2017-09-07 04:23:39.015611
11	3	Are you comfortable speaking in front of strangers?	2017-09-07 04:23:39.038496	2017-09-07 04:23:39.038496
12	3	Who's your fav public speaker?	2017-09-07 04:23:39.042818	2017-09-07 04:23:39.042818
13	3	What are some other positions you're interested in within QGEC? They include head of IT, head of sponsorship, events coordinator, lead marketer, and more	2017-09-07 04:23:39.047568	2017-09-07 04:23:39.047568
14	3	What books have you read in the last month?	2017-09-07 04:23:39.051908	2017-09-07 04:23:39.051908
15	3	What time and date can you interview?	2017-09-07 04:23:39.055998	2017-09-07 04:23:39.055998
16	4	Do you have experience with java?	2017-09-07 04:23:40.386852	2017-09-07 04:23:40.386852
17	4	Do you know version control?	2017-09-07 04:23:40.3911	2017-09-07 04:23:40.3911
18	4	Have you worked in a team?	2017-09-07 04:23:40.394839	2017-09-07 04:23:40.394839
19	5	Do you have experience with R?	2017-09-07 04:23:42.148405	2017-09-07 04:23:42.148405
20	5	How did you find out about QAPT?	2017-09-07 04:23:42.151276	2017-09-07 04:23:42.151276
21	5	Have you worked in a team?	2017-09-07 04:23:42.156075	2017-09-07 04:23:42.156075
\.


--
-- Name: job_posting_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('job_posting_questions_id_seq', 21, true);


--
-- Data for Name: job_postings; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY job_postings (id, created_at, updated_at, status, description, deadline, creator_id, title, job_id, start_date, end_date) FROM stdin;
1	2017-09-07 04:23:38.653087	2017-09-07 04:23:38.653087	2	Sapiente sol aspernatur in cupiditate vorago. Venia qui deprimo urbs animi. Deputo cimentarius tutis cras accusantium. Decens uter voro. Alveus suppellex voluptas cumque spiculum. Et clamo custodia soleo quia deleo.	2017-10-07 04:23:38.634332	\N	Logistics & Finance	3	2017-10-17 04:23:38.635257	2018-05-05 04:23:38.635326
2	2017-09-07 04:23:38.985256	2017-09-07 04:23:38.985256	2	Admoneo sed absque dolor solus. Statua ago eum vulpes deleo. Depono supra animi adeptio ulciscor aestivus. Auctus sol suadeo toties cruciamentum termes tempora. Stipes cruciamentum atrox timidus coaegresco sonitus depraedor. Totam viduo demoror officiis uberrime solvo repellat.	2017-10-07 04:23:38.981859	\N	Head of Sponsorship	4	2017-10-17 04:23:38.983236	2018-05-05 04:23:38.983328
3	2017-09-07 04:23:39.031372	2017-09-07 04:23:39.031372	2	Victoria urbanus aurum cognomen addo damno tracto clam. Viriliter sub animus. Thalassinus vinum confugo valens copiose alioqui votum. Summopere pecus chirographum quis sum.	2017-10-07 04:23:39.028553	\N	Head of Speakers	5	2017-10-17 04:23:39.029409	2018-05-05 04:23:39.029485
4	2017-09-07 04:23:40.381591	2017-09-07 04:23:40.381591	2	Soleo vito autem voluntarius crur usitas voveo. Angelus subiungo cerno possimus inflammatio condico. Audacia quis vos vicinus. Acer custodia rem consequatur. Ascisco canto comitatus calculus solitudo voluptatem strues demo.	2017-10-07 04:23:40.376298	\N	Bot Programmer	9	2017-10-17 04:23:40.377573	2018-05-05 04:23:40.377647
5	2017-09-07 04:23:42.144499	2017-09-07 04:23:42.144499	2	Dicta absum super eos. Asporto corporis copiose facere tabula unde hic. Totus voro temptatio non. Absens ambitus avarus spoliatio possimus clamo calamitas civitas. Comes audeo similique thymum demoror suscipio antiquus varietas.	2017-10-07 04:23:42.140392	\N	Statistics Analyzer	10	2017-10-17 04:23:42.141555	2018-05-05 04:23:42.141638
\.


--
-- Name: job_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('job_postings_id_seq', 5, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY jobs (id, organization_id, title, created_at, updated_at, description, status, role, job_type, job_posting_id) FROM stdin;
1	33	Chair	2017-09-07 04:23:38.039366	2017-09-07 04:23:38.039366	Coadunatio depono clibanus arbor. Adicio arx desino ducimus saepe contigo. Stultus sursum apto video confugo uterque. Templum teneo cultura coniecto turpe. Quos custodia fugit.	1	1	0	\N
2	33	Web & IT	2017-09-07 04:23:38.333336	2017-09-07 04:23:38.333336	Angustus cattus molestias capto strues addo amitto. Casus asperiores eos. Utor enim omnis conspergo esse circumvenio. Utique cariosus aequus uxor rerum vitiosus termes est.	1	0	0	\N
3	33	Logistics & Finance	2017-09-07 04:23:38.619508	2017-09-07 04:23:38.619508	Arma depono aestas. Recusandae maiores barba itaque curto laborum territo. Versus vulticulus deprecator. Angustus cornu aveho comprehendo. Tepidus astrum xiphias aperiam depromo crustulum ducimus. Paulatim omnis tego totus cado audax bardus.	1	0	0	\N
4	33	Head of Sponsorship	2017-09-07 04:23:38.969069	2017-09-07 04:23:38.969069	Quos crudelis adulescens amet teres colo voluptatem. Tui bos suasoria eos torqueo. Defessus speculum damno videlicet. Non aestivus cum color ventosus. Allatus tantum temporibus valeo adulatio adnuo.	1	0	0	\N
5	33	Head of Speakers	2017-09-07 04:23:39.025092	2017-09-07 04:23:39.025092	Uter vulgaris beatus ceno carpo. Statua vulnus peccatus conatus. Non ad deleniti voluptatem tripudio et. Vehemens crebro capio synagoga torrens vito. In clarus acervus desidero terreo verbum. Torqueo canis adeo dolorem.	1	0	0	\N
6	34	Captain	2017-09-07 04:23:39.333965	2017-09-07 04:23:39.333965	Depereo ascit tolero delego aut voco ante aperiam. Derelinquo spiritus agnitio valetudo. Excepturi crapula ustilo deorsum curso demum adopto. Bardus vultuosus ab decerno architecto.	1	1	0	\N
7	34	Human Resources Manager	2017-09-07 04:23:40.109235	2017-09-07 04:23:40.109235	Calco antepono confido ad desidero agnosco qui quae. Bibo cena ut fugit ustilo amet absque demitto. Laudantium solium tamisium amplexus una dolor arto error. Subnecto quis temporibus.	1	1	0	\N
8	34	Tournaments Researcher	2017-09-07 04:23:40.121083	2017-09-07 04:23:40.121083	Viduo argentum advoco spes deleo summisse brevis armo. Tendo vulnero temperantia crudelis venustas. Succedo vester velit abduco. Adsuesco arceo cohaero sumptus perferendis venustas. Amo inventore torqueo thymum. Vulgaris virgo corroboro vomica.	1	0	0	\N
9	34	Bot Programmer	2017-09-07 04:23:40.372024	2017-09-07 04:23:40.372024	Ea vulnero debitis. Utrum videlicet cohaero. Ut dolores quae abundans distinctio beneficium bestia brevis. Textor solium utor. Thermae approbo et vos. Tot deleniti aperio minima pax.	1	0	0	\N
10	34	Statistics Analyzer	2017-09-07 04:23:42.13702	2017-09-07 04:23:42.13702	Tollo volo calcar conicio statua deleniti talio. Autem correptius aptus quis conculco. Et voluptatum tripudio velum arceo. Tamen vacuus auditor tenus carmen comprehendo. Abscido non quia.	1	0	0	\N
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('jobs_id_seq', 10, true);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY organizations (id, created_at, updated_at, email, status, description, department, name) FROM stdin;
1	2017-09-07 04:23:29.259629	2017-09-07 04:23:29.259629	qcbt@engsoc.queensu.ca	0	Laudantium at avoco degero aeternus celebrer curo pecunia. Ipsam absque comes pecto. Bene animi soluta quia. Tabernus corpus dicta subseco caste decimus. Triumphus acsi balbus.	0	Queen's Conference on Business Technology
2	2017-09-07 04:23:29.271937	2017-09-07 04:23:29.271937	qgic@engsoc.queensu.ca	0	Recusandae capio deserunt cenaculum theatrum ceno utique laudantium. Asporto saepe facere aureus venia. Confido armo summopere. Ait spero stabilis. Sustineo patruus aut impedit labore quia. Et centum tepesco caveo sunt cariosus voluptas.	0	Queen's Global Innovation Conference
3	2017-09-07 04:23:29.281042	2017-09-07 04:23:29.281042	englinks@engsoc.queensu.ca	0	Animadverto et venio animus vomica capillus vestrum tempus. Thesaurus id aut. Admiratio copiose cruciamentum spes. Dolores aegrotatio quisquam thymbra.	2	EngLinks
4	2017-09-07 04:23:29.289043	2017-09-07 04:23:29.289043	sciencequest@engsoc.queensu.ca	0	Audax caecus animus cedo. Tergum qui thermae dolorem culpo contabesco apto cito. Curis ut deserunt ascit color delibero solium copia. Cerno adopto ubi verecundia usitas.	2	Science Quest
5	2017-09-07 04:23:29.297769	2017-09-07 04:23:29.297769	ceo@engsoc.queensu.ca	1	Triduana patior adipiscor atavus. Universe a exercitationem occaecati stipes et. Ambitus demergo turpe decet. Thymum tersus abutor calcar utrum sumptus tibi. Placeat repellat aspernatur accedo blandior timor.	2	Campus Equipment Outfitters
6	2017-09-07 04:23:29.306924	2017-09-07 04:23:29.306924	robogals@engsoc.queensu.ca	0	Vester textor subseco copia dedico hic. Eum vacuus sol abutor appono. Clementia debeo dapifer cunctatio bestia colo. Spoliatio ducimus rerum. Aveho candidus suadeo. Celer volo vero curso asper.	3	Robogals
7	2017-09-07 04:23:29.316339	2017-09-07 04:23:29.316339	it.manager@engsoc.queensu.ca	1	Ulterius accipio infit valens vivo. Tametsi tutamen amplus pecus quibusdam. Valeo voluptates tantum spes vorax vulnero. Sollicito peccatus et consequatur terreo officiis. Bibo avaritia nihil turpis damno.	15	IT Team
8	2017-09-07 04:23:29.333317	2017-09-07 04:23:29.333317	fixnclean@engsoc.queensu.ca	0	Universe arbustum strues aureus. Contabesco appositus comptus sint sol versus. Totam auxilium cetera spes truculenter pauper auditor approbo. Architecto callide currus accommodo suppono canis.	8	Fix N' Clean
9	2017-09-07 04:23:29.343801	2017-09-07 04:23:29.343801	fc@engsoc.queensu.ca	0	Denuncio defaeco mollitia strues capitulus timidus. Consequatur sollers quisquam cicuta alienus accipio corroboro. Et clibanus curatio tempora aestus est deprimo eligendi. Correptius colloco averto sono vestrum attonbitus. Patrocinor corona tertius. Surgo spectaculum sublime tutamen tamdiu celebrer consuasor qui.	11	FREC Committee
10	2017-09-07 04:23:29.353203	2017-09-07 04:23:29.353203	movember@engsoc.queensu.ca	0	Voluptatum sperno vetus vae. Curso votum cultura confugo altus. Colo triginta in. Cum culpa natus stella eos ut. Decumbo conforto cursus viduata virtus tam.	4	Movember
11	2017-09-07 04:23:29.361877	2017-09-07 04:23:29.361877	president@engsoc.queensu.ca	1	Audio cibo vel modi voluptas tenax. Attollo timor depopulo. Cubitum aeternus super celo facere desipio. Antea admoveo ager tamquam velum quis asper. Ars coepi theologus colligo.	17	Engineering Society Executive and Director Team
12	2017-09-07 04:23:29.372222	2017-09-07 04:23:29.372222	clarkhall@engsoc.queensu.ca	1	Quibusdam beatae terga vestigium turpis voluptates. Unus supplanto exercitationem despecto studio. Adeptio campana animadverto. Subvenio cursim deripio depono quasi qui. Suspendo aliquid autem eum. Attero clamo officiis laborum minima ustilo.	2	Clark Hall Pub
13	2017-09-07 04:23:37.479225	2017-09-07 04:23:37.479225	tiana_schumm@sipes.info	1	Vulnero tabella consequatur bos sustineo degero tergeo vomica. Ustulo taceo aiunt dolorum consequatur thesis. Contra coruscus audentia auctor creta. Quasi suscipio error vita crustulum cunctatio. Aggero praesentium facere denique et cui annus causa.	3	Washington worshipers
14	2017-09-07 04:23:37.490955	2017-09-07 04:23:37.490955	urban.quigley@roob.org	1	Veritas facere cursus agnosco. Ciminatio amet absorbeo cresco apud. Aspicio supellex corporis.	3	Mississippi druids
15	2017-09-07 04:23:37.502623	2017-09-07 04:23:37.502623	haley_willms@pacocha.io	1	Non voluntarius undique officiis colo. Uredo thymbra verbum conor cribro. Carus certus cultura calcar. Vindico adaugeo conitor. Charisma pecus quos pectus.	3	California elves
16	2017-09-07 04:23:37.513822	2017-09-07 04:23:37.513822	omari@mckenziebarrows.org	1	Caritas molestias tero provident eius cognatus commodi. Tot reprehenderit error timidus circumvenio pecunia cauda. Universe tollo pecco abutor coerceo. Demoror conatus talus.	3	Georgia spiders
17	2017-09-07 04:23:37.52515	2017-09-07 04:23:37.52515	miguel_christiansen@mcglynn.com	1	Ara sperno causa careo. Decretum statua quia vivo deleniti textor. Administratio in absens spero abstergo aestas.	3	West Virginia dwarves
18	2017-09-07 04:23:37.535889	2017-09-07 04:23:37.535889	lori_marks@emmerich.biz	1	Sponte rerum curia denuncio voco nesciunt. Suffoco caelum vapulus sunt. Debitis astrum absconditus statua tumultus succedo autem. Tyrannus virga cunae tolero. Laborum cras auctor.	3	Virginia frogs
19	2017-09-07 04:23:37.54568	2017-09-07 04:23:37.54568	cade_spencer@balistreri.info	1	Ullus beneficium circumvenio sollers sulum totam. Cunabula decerno deludo nobis uredo auxilium. Animus sit curriculum. Placeat cursus defaeco surgo omnis vulariter. Tristis nisi titulus.	3	New York ghosts
20	2017-09-07 04:23:37.555896	2017-09-07 04:23:37.555896	antonina.lemke@greenreichel.biz	1	Demulceo suspendo adulescens accedo tum cura alter tolero. Dens cena deludo defleo aut calcar. Eligendi delibero velit adinventitias adulatio coniuratio tutis est. Adeo tremo ago.	3	Texas giants
21	2017-09-07 04:23:37.571841	2017-09-07 04:23:37.571841	javier_herman@satterfield.co	1	Crustulum convoco voluptas. Aut facere utpote ter conventus vel quisquam. Canis colloco cenaculum tenuis una vultuosus.	3	West Virginia tigers
22	2017-09-07 04:23:37.58427	2017-09-07 04:23:37.58427	eugenia@lindgren.org	1	Contigo utique terreo depulso agnitio sodalitas ultio. Succedo via arcesso molestiae provident animus acer amplexus. Aedificium universe doloremque aer. Cauda tam recusandae ceno currus non vox tandem.	3	New Hampshire lycanthropes
23	2017-09-07 04:23:37.616366	2017-09-07 04:23:37.616366	muriel@wilkinsonmosciski.net	1	Abeo curis temporibus accusantium stips accedo. Vel cimentarius bos sit audeo benigne. Toties sub aufero torrens bis. Totidem molestias tepidus cariosus.	3	Louisiana bears
24	2017-09-07 04:23:37.623868	2017-09-07 04:23:37.623868	jordi@hickle.info	1	At derideo coniuratio. Terga et substantia thesis aggredior credo tunc. Utrum comis bene tyrannus comminor concedo cibus. Arcesso tener ut spoliatio taceo copiose dolorem. Veritatis ut consequuntur.	3	New Hampshire spirits
25	2017-09-07 04:23:37.632576	2017-09-07 04:23:37.632576	jimmie_lynch@abernathyhand.net	1	Depopulo avaritia terreo valeo civitas taceo ceno cupiditas. Ater denuncio clibanus sulum alveus amicitia aperte. Ulciscor sed at iste auctor claro. Adicio auditor vulgus demens tracto. Quas suppono versus tot acidus contego antea cuppedia.	3	Nevada horses
26	2017-09-07 04:23:37.641138	2017-09-07 04:23:37.641138	norberto_runolfon@hane.info	1	Sono sublime tempora amiculum odit sumo vomica. Thesis cupiditas corona cruentus adamo tantillus angulus. Decimus nihil aut textor viriliter. Certus deludo casso voluptas omnis.	3	Maine vampires
27	2017-09-07 04:23:37.650443	2017-09-07 04:23:37.650443	kory@turcotte.co	1	Cultellus cupio auxilium. Quia venia theatrum auctus culpa decimus verto. Corona templum concedo. Tempora turba stips statua.	3	Maryland elves
28	2017-09-07 04:23:37.660351	2017-09-07 04:23:37.660351	robin@kozeychamplin.co	1	Comitatus una causa. Aegre temperantia animadverto utique. Coniecto dolor cinis terminatio cubitum. Ut vis triumphus arma annus ater desolo.	3	Nevada rabbits
29	2017-09-07 04:23:37.669224	2017-09-07 04:23:37.669224	neil.cummings@bernhard.info	1	Arbitro mollitia apparatus. Cena apud vero defero. In comminor communis administratio confugo molestias abundans. Acidus thorax degenero clam cinis nulla ver. Super solum cras aut terror.	3	Virginia druids
30	2017-09-07 04:23:37.675533	2017-09-07 04:23:37.675533	delpha.wisoky@ebert.co	1	Atrocitas vester utilis viduo. Anser vel condico aequitas. Aut verto depraedor suffoco cerno. Pax volva tripudio.	3	New Jersey sheep
31	2017-09-07 04:23:37.683665	2017-09-07 04:23:37.683665	calista@hagenes.name	1	Sint defessus cilicium baiulus. Ut cicuta thema sortitus catena apostolus. Adversus comparo patrocinor peccatus verumtamen. Sophismata veritatis ventito suscipit ipsam super denuncio cogo. Auxilium coadunatio celebrer acer.	3	Missouri dogs
32	2017-09-07 04:23:37.693153	2017-09-07 04:23:37.693153	consuelo.windler@boyer.co	1	Odit aestivus supellex excepturi. Cauda verumtamen absconditus temporibus error cruentus uberrime. Cogito tam eos crustulum statua uterque adinventitias claudeo.	3	California vampires
33	2017-09-07 04:23:37.69918	2017-09-07 04:23:37.69918	qgec@engsoc.queensu.ca	1	Combibo labore acervus degenero acer. Incidunt accusamus taedium. Aqua antea acsi umbra. Ante vulgus soluta tantillus et validus suggero. Creator cupressus argentum paulatim.	0	Queen's Global Energy Conference
34	2017-09-07 04:23:39.066754	2017-09-07 04:23:39.066754	qapt@engsoc.queensu.ca	1	Adhaero super vociferor. Victus supplanto est ademptio compello cubitum asper. A nemo dolores coepi patior. Adduco demum quia tergeo delego arcesso deputo cohaero.	3	Automated Poker Team
\.


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('organizations_id_seq', 34, true);


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY positions (id, job_id, user_id, start_date, end_date) FROM stdin;
1	1	58	2017-08-08 04:23:38.046943	2017-10-07 04:23:38.047214
2	2	59	2017-08-08 04:23:38.33617	2017-10-07 04:23:38.33629
3	3	60	2017-08-08 04:23:38.689501	2017-10-07 04:23:38.689606
4	4	61	2017-08-08 04:23:38.973927	2017-10-07 04:23:38.975392
5	6	62	2017-08-08 04:23:39.337795	2017-10-07 04:23:39.337927
6	6	63	2017-08-08 04:23:39.602967	2017-10-07 04:23:39.603061
7	6	64	2016-11-11 04:23:39.855051	2017-07-09 04:23:39.855136
8	6	65	2016-01-16 04:23:40.101844	2016-11-11 04:23:40.101928
9	7	1	2017-08-08 04:23:40.112515	2017-10-07 04:23:40.112598
10	8	66	2016-01-16 04:23:40.358598	2016-11-11 04:23:40.358801
\.


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('positions_id_seq', 10, true);


--
-- Data for Name: resumes; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY resumes (id, name, attachment, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Name: resumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('resumes_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY schema_migrations (version) FROM stdin;
20170713025207
20170406194804
20170101223405
20170103225829
20161231201711
20170103023835
20170101003910
20170119194442
20170120011714
20170319211129
20170615125213
20170615070156
20170119191806
20170103222855
20170303213245
20170622145543
20170128192931
20170122133539
20170622103638
20170119191424
20170327232545
20170320054018
20170123173833
20170101003242
20170103222349
20170119194018
20170622104052
20170119191521
20170330055621
20170103021009
20170121034853
20170315222305
20170615091221
20170615124023
20170317031054
20170329171110
20170121035125
20161228231553
20170101213218
20170123181607
20170103235116
20170630051233
20170314040327
20170329203354
20170317032431
20170119190731
20170315222726
20170303214828
20170226011652
20170319034911
20170327222433
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dash
--

COPY users (id, first_name, last_name, phone_number, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, role, student, gender, birthday, faculty, specialization, tagline, bio, preferred_name) FROM stdin;
1	Robert	Saunders	\N	superadmin@example.com	$2a$11$0W2SgurBunsVwGfnCboZWOykgcAiLrFWi/mBqBms8Va5IziRqhfQK	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:21.569517	2017-09-07 04:23:21.569517	1	t	0	\N	\N	\N	\N	\N	\N
2	Student	Test	\N	test@example.com	$2a$11$pbuliPuqZ/2qWnUN.U.lzupLX521Kw2XhdsvGKpliuZz/uVI1ItNe	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:21.850625	2017-09-07 04:23:21.850625	0	t	0	\N	\N	\N	\N	\N	\N
3	Emily	Weirsma	\N	emily@queensu.ca	$2a$11$91jMOIRqTzPBQ2chH4Yd3uMeo7D1t9y.KHpReu/mausBKCPOQ2zSe	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:22.095677	2017-09-07 04:23:22.095677	0	t	0	\N	\N	\N	\N	\N	\N
4	Carson	Cook	\N	carson@queensu.ca	$2a$11$mdeKR6GkXtKHaoyecBYVdOY9YDvhqG1yVZEW2Eso6l5cUVxfMO7iG	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:22.361413	2017-09-07 04:23:22.361413	0	t	0	\N	\N	\N	\N	\N	\N
5	Jill	Reid	\N	jill@queensu.ca	$2a$11$zSVQznu0UfpmS4uP9WM3weUWPg/U.ddFywGhHaXCwnLqe517vTGZO	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:22.643461	2017-09-07 04:23:22.643461	0	t	0	\N	\N	\N	\N	\N	\N
6	Rob	Saunders	\N	rob@queensu.ca	$2a$11$8sANgo0zqlToLeaogSGrQeZ6UoFty9KQul84SHESYc.4W2NRo6XXS	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:22.919168	2017-09-07 04:23:22.919168	0	t	0	\N	\N	\N	\N	\N	\N
7	Peter	Ju	\N	peter@queensu.ca	$2a$11$oBZNSXlg4IizclpfoPTbJ.BTmUatLLLuBoeedLCb2rygdKmzE9mFi	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:23.185318	2017-09-07 04:23:23.185318	0	t	0	\N	\N	\N	\N	\N	\N
8	Tester	0	\N	test0@test.com	$2a$11$Sjv5n7VMUENUU3At56q8ZeT7KXgFKLx9SoX3/6AhFyuO0NJCO4kNC	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:23.459377	2017-09-07 04:23:23.459377	0	t	0	\N	\N	\N	\N	\N	\N
9	Tester	1	\N	test1@test.com	$2a$11$wOi97upfMK4cWWvfCE23eOHaMEPHZeQeVu1wywkWUesi7pD17QSne	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:23.725853	2017-09-07 04:23:23.725853	0	t	0	\N	\N	\N	\N	\N	\N
10	Tester	2	\N	test2@test.com	$2a$11$GGrS6W580DZvo9oIniwWO.ExwKZ5NUPwDX82BY4m8g2CJZ7kfbmM6	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:24.009881	2017-09-07 04:23:24.009881	0	t	0	\N	\N	\N	\N	\N	\N
11	Tester	3	\N	test3@test.com	$2a$11$nKhaEW1WUbsC9Cy/Gctww..plUk6/9XL9uZU.UbMZByBfdCpRgfRC	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:24.276302	2017-09-07 04:23:24.276302	0	t	0	\N	\N	\N	\N	\N	\N
12	Tester	4	\N	test4@test.com	$2a$11$5ll3gDmRZzXnofrzcFHbQOS9ngEw6hnCDlia0gMdcWd5mhwdLg.HW	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:24.544192	2017-09-07 04:23:24.544192	0	t	0	\N	\N	\N	\N	\N	\N
13	Tester	5	\N	test5@test.com	$2a$11$uFFvxx7JLS8iTPp.KnhcDeSHEuLkDF8UZsgka2MJlhW0CSwDz4JNe	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:24.835288	2017-09-07 04:23:24.835288	0	t	0	\N	\N	\N	\N	\N	\N
14	Tester	6	\N	test6@test.com	$2a$11$ABLYa16ib/CDnKE4ywaZUueqr49aqC.o2osvNkkq3HqDXQKzlGJ7m	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:25.129902	2017-09-07 04:23:25.129902	0	t	0	\N	\N	\N	\N	\N	\N
15	Tester	7	\N	test7@test.com	$2a$11$p4HAUekFpL7zd3Z0vGBGdOe9QnqnfFsFnpYP/dJ4OLTzTDpNqhQty	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:25.406228	2017-09-07 04:23:25.406228	0	t	0	\N	\N	\N	\N	\N	\N
16	Tester	8	\N	test8@test.com	$2a$11$F6hJeTsHJ2psEFv7DpBFbeofBzZnuUHaaP7fJoWMRRIEHj420wTHC	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:25.662905	2017-09-07 04:23:25.662905	0	t	0	\N	\N	\N	\N	\N	\N
17	Tester	9	\N	test9@test.com	$2a$11$BnIKiALcUovpC/D8QQY4YeRRPYkMEPWXEIFpN3CGpmMEWXVi9JrUy	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:25.919678	2017-09-07 04:23:25.919678	0	t	0	\N	\N	\N	\N	\N	\N
18	Tester	10	\N	test10@test.com	$2a$11$cTL8DEYrxQ3O8VTnbzYZZupyOnwI.JR1XsLxgOr0miFSrldfX86QG	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:26.154636	2017-09-07 04:23:26.154636	0	t	0	\N	\N	\N	\N	\N	\N
19	Tester	11	\N	test11@test.com	$2a$11$nsZUjRIvdfah4svUFioTUe0RwVhm4BQ1cuQ0tUHx.AyDJExQIba6W	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:26.419667	2017-09-07 04:23:26.419667	0	t	0	\N	\N	\N	\N	\N	\N
20	Tester	12	\N	test12@test.com	$2a$11$qzL87HFgdeFzgBZL./bWbeIpf6oph1hHnNAH2k2rVlD3N6p/f51JO	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:26.679975	2017-09-07 04:23:26.679975	0	t	0	\N	\N	\N	\N	\N	\N
21	Tester	13	\N	test13@test.com	$2a$11$JaK.bTU0xZ2gOqcDtU2QtOkzrB0A4NKiLn18jtCEwTBpUf7DiMhxS	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:26.941123	2017-09-07 04:23:26.941123	0	t	0	\N	\N	\N	\N	\N	\N
22	Tester	14	\N	test14@test.com	$2a$11$HIyYkDXuSph1mEmEaTSJC.bUIZRR9FdFowUlfbaf8WIgQwisLFf6W	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:27.211386	2017-09-07 04:23:27.211386	0	t	0	\N	\N	\N	\N	\N	\N
23	Tester	15	\N	test15@test.com	$2a$11$5ckvVXgu8sntJPvnkKGBMuzrdcGrvP9cpazBd1vh3FNwUMbt8Xwde	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:27.467761	2017-09-07 04:23:27.467761	0	t	0	\N	\N	\N	\N	\N	\N
24	Tester	16	\N	test16@test.com	$2a$11$s7jKQehLzUsufu7fLvgVC.bsvAjl0lYg9/Z/NrDyrPoHF6/.7b1cy	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:27.731136	2017-09-07 04:23:27.731136	0	t	0	\N	\N	\N	\N	\N	\N
25	Tester	17	\N	test17@test.com	$2a$11$NnPPwTocu/QavZycucBdquttD5XWFednFq2ZT7eJ2YeWQqIm4Adfa	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:27.987703	2017-09-07 04:23:27.987703	0	t	0	\N	\N	\N	\N	\N	\N
26	Tester	18	\N	test18@test.com	$2a$11$lPsCF.hVVBpsTeanPsx95.tDPa9kRdoXz/1EY73yHB1TvvxDNk8fS	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:28.25517	2017-09-07 04:23:28.25517	0	t	0	\N	\N	\N	\N	\N	\N
27	Tester	19	\N	test19@test.com	$2a$11$V4t6uRc50liuGfKYzjxzC.eRFVUqnvie1hNKy9ju0chjIPMN6zGBu	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:28.525912	2017-09-07 04:23:28.525912	0	t	0	\N	\N	\N	\N	\N	\N
28	Dominique Hagenes DDS	Dayne Renner MD	\N	wiley.ohara@wyman.io	$2a$11$2.WhTJlsjXShmJnr4vFdgeAOONCNjBUqS7it9aCSDiD.w6CxLmWue	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:29.636172	2017-09-07 04:23:29.636172	0	t	1	\N	\N	\N	\N	\N	\N
29	Mr. Aaron Sauer	Miss Kayli Mraz	\N	mabelle_borer@ankundingortiz.org	$2a$11$bIzmg31p12in7wDO7ROYUuYH9tdcCVw6PTX7qpXdXEiGed.eheAEq	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:29.903741	2017-09-07 04:23:29.903741	0	t	1	\N	\N	\N	\N	\N	\N
30	Jadyn Stanton	Sallie Yundt	\N	horace@reilly.info	$2a$11$SO.MOSx6f1Uk8DB9cyf4rumYuMEjQyTH.xzooiArmyf7h1sFA5cZK	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:30.227114	2017-09-07 04:23:30.227114	0	t	1	\N	\N	\N	\N	\N	\N
31	Kristy Cole	Ford Cummerata	\N	simone_schmeler@weimannkuhn.biz	$2a$11$Qn77ax5ZRn5YYWkDA.H1H.Ye7yhsTdVGHwwOBk0BTJQEzFO8sXoGy	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:30.474442	2017-09-07 04:23:30.474442	0	t	1	\N	\N	\N	\N	\N	\N
32	Odell Ward	Marianne Pacocha	\N	osvaldo_bernier@kovacek.name	$2a$11$3OuhhdHRej8MvQiMEHWFt.ZFLo8QH3DFPOt/Ms6SxwGG50E.u2Fp2	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:30.761228	2017-09-07 04:23:30.761228	0	t	1	\N	\N	\N	\N	\N	\N
33	Whitney Wintheiser	Mrs. Jesus Pfannerstill	\N	shad@bednar.net	$2a$11$JT6udLwFv0RBtrg4GExy1OaINujz1E0Ov3t8BPVoU4a4b8GDo7JeW	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:31.012496	2017-09-07 04:23:31.012496	0	t	1	\N	\N	\N	\N	\N	\N
34	Marley Armstrong	Bernhard Stark	\N	freddy.will@jacobs.info	$2a$11$qFx6IlZ.R0FNtn7tb3tzg.JgOfEfWsZIny1ip9qdtKApWHsP33kiy	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:31.255491	2017-09-07 04:23:31.255491	0	t	1	\N	\N	\N	\N	\N	\N
35	Wendell Kemmer	Tyra Purdy	\N	wilford@goldnerreichel.info	$2a$11$kLBN22JBsEwpiu37jXbPKu3jfFeryrp81nXsFwIwYkjYmGuqPU0L2	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:31.518585	2017-09-07 04:23:31.518585	0	t	1	\N	\N	\N	\N	\N	\N
36	Sim Witting Jr.	Stephany Kunze	\N	charlie@schneider.info	$2a$11$nSuwepcyOeSqFZtfMBmRG.T4xSiYgh00f3LXIaykchLSp0y1umjqW	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:31.770831	2017-09-07 04:23:31.770831	0	t	1	\N	\N	\N	\N	\N	\N
37	Annetta Macejkovic	Greg Bayer	\N	tamia.wyman@bailey.co	$2a$11$rNrrHxcAvmQIGOAveDHeoOE8TKZoC3PaM/2IsDWQdDQ2LVRB1tWrK	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:32.015804	2017-09-07 04:23:32.015804	0	t	1	\N	\N	\N	\N	\N	\N
38	Dr. Heaven Mertz	Nikolas Littel MD	\N	chelsey@wunsch.biz	$2a$11$/yEiQX2OSZYND0d1mQvil.PdXkEPjqRNyxPLt9W80fLREs5HUQlla	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:32.296276	2017-09-07 04:23:32.296276	0	t	1	\N	\N	\N	\N	\N	\N
39	Mr. Gillian Bahringer	Brandi Waters DVM	\N	vern@kunzegraham.info	$2a$11$2jjaocqCXioFBwtZSplNvek6r5FWeVjrnDpEa1A.aw16BnD81AGkS	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:32.575564	2017-09-07 04:23:32.575564	0	t	1	\N	\N	\N	\N	\N	\N
40	Alysson Labadie	Ms. German Schmidt	\N	eliezer@ferry.io	$2a$11$NJwp2SCgq0EdEe4Kd.mD9eHqHyFx3y.d3vwY7eL357hPxA5kRAiw.	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:32.862898	2017-09-07 04:23:32.862898	0	t	1	\N	\N	\N	\N	\N	\N
41	Dr. Tamara Hand	Tianna Klein	\N	ladarius.metz@corwinschumm.net	$2a$11$V2FeZ3D/7dSfj2KClJ4k.eGaPxuHyeXgl0Tja0VmS4/5F/nETLYZy	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:33.159288	2017-09-07 04:23:33.159288	0	t	1	\N	\N	\N	\N	\N	\N
42	Lorenzo Jones Jr.	Kariane Frami	\N	bartholome_littel@stiedemann.com	$2a$11$SfGs3p/3MiLPg5nBJCXQZOJ875a/ugK9In6DyI.g24ADPfHuWJB8G	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:33.43215	2017-09-07 04:23:33.43215	0	t	1	\N	\N	\N	\N	\N	\N
43	Josianne Frami	Pamela Torp	\N	penelope_larkin@thiel.com	$2a$11$AYjopQiv6PC9hYLGCGg//.aoZ0K0kVk6TgbgpSbaAkEaer3jux4Ji	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:33.702782	2017-09-07 04:23:33.702782	0	t	1	\N	\N	\N	\N	\N	\N
44	Hilma Friesen	Forrest Hansen	\N	bulah@parisian.biz	$2a$11$dBiE3tZulRz4SlRuWltfTOpdoCV..e6LX2K2FiO4CRpGhvzO4QQTu	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:33.975146	2017-09-07 04:23:33.975146	0	t	1	\N	\N	\N	\N	\N	\N
45	Willis Boehm	Salvatore O'Conner MD	\N	rickey.ankunding@erdman.info	$2a$11$TpatYXbH2mCTt0JE6xvOw.HZMf93BOQw9h.idVQfx6qFyNyn.EuZq	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:34.254304	2017-09-07 04:23:34.254304	0	t	1	\N	\N	\N	\N	\N	\N
46	Aida Lueilwitz	Melvin Aufderhar	\N	osbaldo@eichmannschiller.info	$2a$11$/wLemcSebAPoQVqttONqwuJNCyDf7txL4bbDj6zx7WLwKt35T1FVC	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:34.529267	2017-09-07 04:23:34.529267	0	t	1	\N	\N	\N	\N	\N	\N
47	Christina Stanton	Dr. Beaulah Ruecker	\N	terry_weimann@jakubowskiupton.co	$2a$11$OdzizOWrkqshDagbTefL1OBYXcXQ/GP7p3G2HnkuhldqWn4ef48De	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:34.791648	2017-09-07 04:23:34.791648	0	t	1	\N	\N	\N	\N	\N	\N
48	Brigitte Collier	Werner Schmeler	\N	julio.koelpin@corkery.name	$2a$11$5XvUZhEUmsrQ1tb7fUVC/eq8DocXOxuqcfs16fDkWN8Dv5qMYuVxm	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:35.089545	2017-09-07 04:23:35.089545	0	t	1	\N	\N	\N	\N	\N	\N
49	Sherwood Hoppe DVM	Emile Nienow	\N	kelvin@corkery.io	$2a$11$MI6q.GaztJ7k6vJcrHLrW.ZlUMVfy/aCMB8hn.Id0ynVRuGeVHYhK	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:35.368219	2017-09-07 04:23:35.368219	0	t	1	\N	\N	\N	\N	\N	\N
50	Geovanny Aufderhar	Dr. Amelie Maggio	\N	kaia.dicki@damoresenger.net	$2a$11$LbTLJfvo94c/Bp0FK9Fc0ObDbbzrHv9EGpoz5iELiiC1YBmQDTIs2	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:35.627133	2017-09-07 04:23:35.627133	0	t	1	\N	\N	\N	\N	\N	\N
51	Maritza O'Connell	Zane Gusikowski	\N	junius@haley.org	$2a$11$JcpJEgrPkjgNA6bDJjvsWOlz2p9HeLhWFa0uGzDN4ws73rc.bA14G	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:35.885761	2017-09-07 04:23:35.885761	0	t	1	\N	\N	\N	\N	\N	\N
52	Chasity Lemke	Ms. Jonathan Funk	\N	flo@pourosbarton.net	$2a$11$T9q9.JP717WnoY90xv3FdexYxZpStEKaVO/GEZPp0O0a5Sl57pRXq	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:36.124216	2017-09-07 04:23:36.124216	0	t	1	\N	\N	\N	\N	\N	\N
53	Mr. Duncan Pacocha	Ms. Rodolfo Towne	\N	jaquan_stracke@johnson.biz	$2a$11$WPGxMLfX0VHaLjJKGYg5.OcwI/MHjzd.eHAUWfVGDIP.c1gbRq0.m	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:36.389358	2017-09-07 04:23:36.389358	0	t	1	\N	\N	\N	\N	\N	\N
54	Trycia Stehr	Lauriane Johnston	\N	spencer.oconner@mckenzie.name	$2a$11$BHtTBdZYmkmFQnQN3NzJnu8kQY6i0WZxVZOuCeFqT3k.scRXv1HTa	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:36.653886	2017-09-07 04:23:36.653886	0	t	1	\N	\N	\N	\N	\N	\N
55	Buck Daniel DDS	Dr. Shanel Shields	\N	vincent@haley.com	$2a$11$UtiD1H0pj5rOdDvhTy6jcOE13q2g.YrLVP.N78rsZfAR0//818nvq	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:36.917906	2017-09-07 04:23:36.917906	0	t	1	\N	\N	\N	\N	\N	\N
56	Ewald Breitenberg	Miss Isidro Effertz	\N	genoveva@swift.name	$2a$11$H1p3sO/doufqraHU3Qva0e.JfCanbHef1Jp5f/MzbHeOxgb2zdQkO	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:37.197083	2017-09-07 04:23:37.197083	0	t	1	\N	\N	\N	\N	\N	\N
57	Darrel Gorczany	Roosevelt Lehner	\N	caidy.jacobi@wildermandoyle.net	$2a$11$5M0IR9JSEKKPdKgdcuR1H.qsL7WOCYbG8xbDKkG9KIWcI1qOPr9Gu	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:37.465054	2017-09-07 04:23:37.465054	0	t	1	\N	\N	\N	\N	\N	\N
58	Katrina	Stirling	\N	kat@queensu.ca	$2a$11$MsMkfSbN710YBna2EBrx0eew2wloFMdIjSIb.dJH3LydbJtbTPAj2	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:37.971982	2017-09-07 04:23:37.971982	0	t	0	\N	\N	\N	\N	\N	\N
59	Peter	Ju	\N	pete@queensu.ca	$2a$11$OtW.wShlODphzqc7o0HeP.xWCX6uq9pli6yccGKKEiZEqCIlmK2mK	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:38.324166	2017-09-07 04:23:38.324166	0	t	0	\N	\N	\N	\N	\N	\N
60	Farhaj	Khan	\N	farhaj@queensu.ca	$2a$11$A8RaZFg6otTT8BDR35MtWOCto5yuMNN12T.wqNBQN9NxXARiYbdI.	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:38.60942	2017-09-07 04:23:38.60942	0	t	0	\N	\N	\N	\N	\N	\N
61	Graham	Girard	\N	graham@queensu.ca	$2a$11$muLg8pxHbxyQ0h6IJ1sNbOzArdGOezILXuBWVJftHbxwkU6j9jIUO	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:38.957894	2017-09-07 04:23:38.957894	0	t	0	\N	\N	\N	\N	\N	\N
62	Stosh	Fabricus	\N	stosh@queensu.ca	$2a$11$3gw8CDPh2otNEMGCYKTIWek5Uc0ESSOl7MPu7Nw9.NYojsT4TsDoO	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:39.328066	2017-09-07 04:23:39.328066	0	t	0	\N	\N	\N	\N	\N	\N
63	Robert	Sun	\N	sun@queensu.ca	$2a$11$FZINFOE/1fGHs113NIu0mOSvpNDM1yAkpyUxqH7PLz.kQ3XrE5C66	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:39.599836	2017-09-07 04:23:39.599836	0	t	0	\N	\N	\N	\N	\N	\N
64	Mark	Tamming	\N	tamming@queensu.ca	$2a$11$ucRsunwUqkuQVplLM.7wgeB5ZbX1B8oofqawMplzgKoSdqnCozpyy	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:39.852367	2017-09-07 04:23:39.852367	0	t	0	\N	\N	\N	\N	\N	\N
65	Jacob	Markstrom	\N	jacob@queensu.ca	$2a$11$X4gKMxanqyseRHK.AvJTqOaock7ZKuhFwD9RXQbo552f1HoBFtPDe	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:40.099386	2017-09-07 04:23:40.099386	0	t	0	\N	\N	\N	\N	\N	\N
66	Mario	Lemieux	\N	mario@queensu.ca	$2a$11$o6qz1r0Y/oPZBGoKkgQmUuwtN9whG0/A0RB3aO1r0pLX6nZMDmrbm	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:40.354758	2017-09-07 04:23:40.354758	0	t	0	\N	\N	\N	\N	\N	\N
67	Chris	Barnes	\N	chris@queensu.ca	$2a$11$RYwMje6KQyhtm4CuT4iYluh4xXGILC0wa0fedVQjGxr/yt.i/Ki9K	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:40.656217	2017-09-07 04:23:40.656217	0	t	0	\N	\N	\N	\N	\N	\N
68	James	Pang	\N	james@queensu.ca	$2a$11$S.V7J4ypixC/sAdDD4PDYOBXYLZQEcUpVT9Ej4ze1gz.iEZhVPp4y	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:40.973593	2017-09-07 04:23:40.973593	0	t	0	\N	\N	\N	\N	\N	\N
69	Nathan	Akinson	\N	nathan@queensu.ca	$2a$11$EkHDRvxPTRuiPDX8cdFqdORtzZnD3XqxIs9JuXZUU2E6yTM6/8YQ2	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:41.265685	2017-09-07 04:23:41.265685	0	t	0	\N	\N	\N	\N	\N	\N
70	Otto	Bismark	\N	otto@queensu.ca	$2a$11$uNei.JLkO6txvk/xIOXLeeZ21iG3hw/t.C3keznz0/sS7pC6asE5e	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:41.548878	2017-09-07 04:23:41.548878	0	t	0	\N	\N	\N	\N	\N	\N
71	Steve	Jobs	\N	steve@queensu.ca	$2a$11$bX6W7D5qPxvfxzs.h5LLgek4075c1X/a3PdmXnEek5MVV/N634BS2	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:41.828277	2017-09-07 04:23:41.828277	0	t	0	\N	\N	\N	\N	\N	\N
72	Mark	Zuckerberg	\N	mark@queensu.ca	$2a$11$xwOOpC2UzsC7tshSJNWnle81R8KeKqDpV7n9va9X310m3TfYkxc2y	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:42.11422	2017-09-07 04:23:42.11422	0	t	0	\N	\N	\N	\N	\N	\N
73	Spencer	Evans	\N	spencer@queensu.ca	$2a$11$ALhY4l3rQcWpGM52y6/s4OcAi2VzFSphzLJpggDyOefpbC/uvNe8e	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:42.408858	2017-09-07 04:23:42.408858	0	t	0	\N	\N	\N	\N	\N	\N
74	John	Nash	\N	john@queensu.ca	$2a$11$NBIOiCKJNAaSC/s7muHRnOj8v1KIOacR5jb4nIBw4UcIrxHYszP9a	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:42.67821	2017-09-07 04:23:42.67821	0	t	0	\N	\N	\N	\N	\N	\N
75	Julius	Antonius	\N	julius@queensu.ca	$2a$11$p883IG3lMro9NxPdP67gEOxbGasDVaz4vLCPYaGGYAoDWuZXZeCtO	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:42.927506	2017-09-07 04:23:42.927506	0	t	0	\N	\N	\N	\N	\N	\N
76	Cleo	Patra	\N	cleo@queensu.ca	$2a$11$f0ybqcp.aTqF1wAk85Ud..gKLlHBgmrf4hLYs6Dtdnr1blQI8E4iG	\N	\N	\N	0	\N	\N	\N	\N	2017-09-07 04:23:43.218163	2017-09-07 04:23:43.218163	0	t	0	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dash
--

SELECT pg_catalog.setval('users_id_seq', 76, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: interviews_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY interviews
    ADD CONSTRAINT interviews_pkey PRIMARY KEY (id);


--
-- Name: job_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY job_applications
    ADD CONSTRAINT job_applications_pkey PRIMARY KEY (id);


--
-- Name: job_posting_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY job_posting_answers
    ADD CONSTRAINT job_posting_answers_pkey PRIMARY KEY (id);


--
-- Name: job_posting_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY job_posting_questions
    ADD CONSTRAINT job_posting_questions_pkey PRIMARY KEY (id);


--
-- Name: job_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY job_postings
    ADD CONSTRAINT job_postings_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dash; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_interviews_on_job_application_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_interviews_on_job_application_id ON interviews USING btree (job_application_id);


--
-- Name: index_job_applications_on_resumes_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_job_applications_on_resumes_id ON job_applications USING btree (resumes_id);


--
-- Name: index_job_posting_answers_on_job_application_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_job_posting_answers_on_job_application_id ON job_posting_answers USING btree (job_application_id);


--
-- Name: index_job_posting_answers_on_job_posting_questions_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_job_posting_answers_on_job_posting_questions_id ON job_posting_answers USING btree (job_posting_questions_id);


--
-- Name: index_job_posting_questions_on_job_posting_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_job_posting_questions_on_job_posting_id ON job_posting_questions USING btree (job_posting_id);


--
-- Name: index_job_postings_on_job_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_job_postings_on_job_id ON job_postings USING btree (job_id);


--
-- Name: index_jobs_on_job_posting_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_jobs_on_job_posting_id ON jobs USING btree (job_posting_id);


--
-- Name: index_jobs_on_organization_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_jobs_on_organization_id ON jobs USING btree (organization_id);


--
-- Name: index_positions_on_job_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_positions_on_job_id ON positions USING btree (job_id);


--
-- Name: index_positions_on_user_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_positions_on_user_id ON positions USING btree (user_id);


--
-- Name: index_resumes_on_user_id; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE INDEX index_resumes_on_user_id ON resumes USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dash; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: fk_rails_00ebd5b653; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY interviews
    ADD CONSTRAINT fk_rails_00ebd5b653 FOREIGN KEY (job_application_id) REFERENCES job_applications(id);


--
-- Name: fk_rails_20f1e6b8ed; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_posting_answers
    ADD CONSTRAINT fk_rails_20f1e6b8ed FOREIGN KEY (job_posting_questions_id) REFERENCES job_posting_questions(id);


--
-- Name: fk_rails_286d997ec0; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_postings
    ADD CONSTRAINT fk_rails_286d997ec0 FOREIGN KEY (job_id) REFERENCES jobs(id);


--
-- Name: fk_rails_867611551d; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY resumes
    ADD CONSTRAINT fk_rails_867611551d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_a1e66c84e3; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_posting_questions
    ADD CONSTRAINT fk_rails_a1e66c84e3 FOREIGN KEY (job_posting_id) REFERENCES job_postings(id);


--
-- Name: fk_rails_f4f4cea132; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_posting_answers
    ADD CONSTRAINT fk_rails_f4f4cea132 FOREIGN KEY (job_application_id) REFERENCES job_applications(id);


--
-- Name: fk_rails_f9e99f7556; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT fk_rails_f9e99f7556 FOREIGN KEY (job_posting_id) REFERENCES job_postings(id);


--
-- Name: fk_rails_fbb418e5cd; Type: FK CONSTRAINT; Schema: public; Owner: dash
--

ALTER TABLE ONLY job_applications
    ADD CONSTRAINT fk_rails_fbb418e5cd FOREIGN KEY (resumes_id) REFERENCES resumes(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

