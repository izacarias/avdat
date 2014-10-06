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
-- Name: acidentes_pais; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_pais (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.acidentes_pais OWNER TO avdat;

--
-- Name: acidentes_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_pais_id_seq OWNER TO avdat;

--
-- Name: acidentes_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_pais_id_seq OWNED BY acidentes_pais.id;


--
-- Name: acidentes_regiao; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_regiao (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.acidentes_regiao OWNER TO avdat;

--
-- Name: acidentes_regiao_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_regiao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_regiao_id_seq OWNER TO avdat;

--
-- Name: acidentes_regiao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_regiao_id_seq OWNED BY acidentes_regiao.id;


--
-- Name: acidentes_seriespais; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_seriespais (
    id integer NOT NULL,
    pais_id integer NOT NULL,
    ano integer NOT NULL,
    acidentes numeric(5,2) NOT NULL
);


ALTER TABLE public.acidentes_seriespais OWNER TO avdat;

--
-- Name: acidentes_seriespais_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_seriespais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_seriespais_id_seq OWNER TO avdat;

--
-- Name: acidentes_seriespais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_seriespais_id_seq OWNED BY acidentes_seriespais.id;


--
-- Name: acidentes_seriesregioes; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_seriesregioes (
    id integer NOT NULL,
    regiao_id integer NOT NULL,
    ano integer NOT NULL,
    acidentes numeric(5,2) NOT NULL
);


ALTER TABLE public.acidentes_seriesregioes OWNER TO avdat;

--
-- Name: acidentes_seriesregioes_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_seriesregioes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_seriesregioes_id_seq OWNER TO avdat;

--
-- Name: acidentes_seriesregioes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_seriesregioes_id_seq OWNED BY acidentes_seriesregioes.id;


--
-- Name: acidentes_seriessexo; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_seriessexo (
    id integer NOT NULL,
    sexo_id integer NOT NULL,
    ano integer NOT NULL,
    acidentes numeric(5,2) NOT NULL
);


ALTER TABLE public.acidentes_seriessexo OWNER TO avdat;

--
-- Name: acidentes_seriessexo_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_seriessexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_seriessexo_id_seq OWNER TO avdat;

--
-- Name: acidentes_seriessexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_seriessexo_id_seq OWNED BY acidentes_seriessexo.id;


--
-- Name: acidentes_seriesuniaofederacao; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_seriesuniaofederacao (
    id integer NOT NULL,
    uf_id integer NOT NULL,
    ano integer NOT NULL,
    acidentes numeric(5,2) NOT NULL
);


ALTER TABLE public.acidentes_seriesuniaofederacao OWNER TO avdat;

--
-- Name: acidentes_seriesuniaofederacao_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_seriesuniaofederacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_seriesuniaofederacao_id_seq OWNER TO avdat;

--
-- Name: acidentes_seriesuniaofederacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_seriesuniaofederacao_id_seq OWNED BY acidentes_seriesuniaofederacao.id;


--
-- Name: acidentes_sexo; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_sexo (
    id integer NOT NULL,
    sigla character varying(1) NOT NULL,
    descricao character varying(10) NOT NULL
);


ALTER TABLE public.acidentes_sexo OWNER TO avdat;

--
-- Name: acidentes_sexo_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_sexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_sexo_id_seq OWNER TO avdat;

--
-- Name: acidentes_sexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_sexo_id_seq OWNED BY acidentes_sexo.id;


--
-- Name: acidentes_uniaofederacao; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE acidentes_uniaofederacao (
    id integer NOT NULL,
    sigla character varying(2) NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.acidentes_uniaofederacao OWNER TO avdat;

--
-- Name: acidentes_uniaofederacao_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE acidentes_uniaofederacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acidentes_uniaofederacao_id_seq OWNER TO avdat;

--
-- Name: acidentes_uniaofederacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE acidentes_uniaofederacao_id_seq OWNED BY acidentes_uniaofederacao.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO avdat;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO avdat;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO avdat;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO avdat;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO avdat;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO avdat;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO avdat;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO avdat;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO avdat;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO avdat;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO avdat;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO avdat;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO avdat;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO avdat;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO avdat;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: avdat
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO avdat;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdat
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: avdat; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO avdat;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_pais ALTER COLUMN id SET DEFAULT nextval('acidentes_pais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_regiao ALTER COLUMN id SET DEFAULT nextval('acidentes_regiao_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriespais ALTER COLUMN id SET DEFAULT nextval('acidentes_seriespais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriesregioes ALTER COLUMN id SET DEFAULT nextval('acidentes_seriesregioes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriessexo ALTER COLUMN id SET DEFAULT nextval('acidentes_seriessexo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriesuniaofederacao ALTER COLUMN id SET DEFAULT nextval('acidentes_seriesuniaofederacao_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_sexo ALTER COLUMN id SET DEFAULT nextval('acidentes_sexo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_uniaofederacao ALTER COLUMN id SET DEFAULT nextval('acidentes_uniaofederacao_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Data for Name: acidentes_pais; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_pais (id, nome) FROM stdin;
1	Brasil
\.


--
-- Name: acidentes_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_pais_id_seq', 1, true);


--
-- Data for Name: acidentes_regiao; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_regiao (id, nome) FROM stdin;
1	Norte
2	Regiao Nordeste
3	Regiao Sudeste
4	Regiao Sul
5	Regiao Centro-Oeste
\.


--
-- Name: acidentes_regiao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_regiao_id_seq', 5, true);


--
-- Data for Name: acidentes_seriespais; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_seriespais (id, pais_id, ano, acidentes) FROM stdin;
1	1	1997	23.11
2	1	1998	20.45
3	1	1999	19.94
4	1	2000	19.36
5	1	2001	15.31
6	1	2002	16.69
7	1	2003	16.47
8	1	2004	18.01
9	1	2005	18.12
10	1	2006	18.20
11	1	2007	16.96
12	1	2008	16.56
\.


--
-- Name: acidentes_seriespais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_seriespais_id_seq', 12, true);


--
-- Data for Name: acidentes_seriesregioes; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_seriesregioes (id, regiao_id, ano, acidentes) FROM stdin;
1	1	1997	14.10
2	2	1997	11.00
3	3	1997	25.84
4	4	1997	27.90
5	5	1997	15.08
6	1	1998	13.22
7	2	1998	9.24
8	3	1998	22.90
9	4	1998	24.85
10	5	1998	13.36
11	1	1999	14.96
12	2	1999	9.45
13	3	1999	21.94
14	4	1999	24.00
15	5	1999	13.98
16	1	2000	16.60
17	2	2000	11.26
18	3	2000	19.56
19	4	2000	26.02
20	5	2000	15.94
21	1	2001	13.94
22	2	2001	8.19
23	3	2001	15.74
24	4	2001	20.26
25	5	2001	13.33
26	1	2002	14.30
27	2	2002	9.23
28	3	2002	17.52
29	4	2002	21.53
30	5	2002	14.15
31	1	2003	14.66
32	2	2003	9.76
33	3	2003	17.08
34	4	2003	20.89
35	5	2003	14.83
36	1	2004	17.33
37	2	2004	11.07
38	3	2004	18.83
39	4	2004	22.11
40	5	2004	15.90
41	1	2005	16.26
42	2	2005	11.42
43	3	2005	19.15
44	4	2005	21.95
45	5	2005	15.75
46	1	2006	16.32
47	2	2006	11.85
48	3	2006	19.30
49	4	2006	21.52
50	5	2006	16.30
51	1	2007	15.29
52	2	2007	11.00
53	3	2007	18.05
54	4	2007	19.54
55	5	2007	16.43
56	1	2008	13.94
57	2	2008	10.56
58	3	2008	17.83
59	4	2008	19.09
60	5	2008	15.83
\.


--
-- Name: acidentes_seriesregioes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_seriesregioes_id_seq', 60, true);


--
-- Data for Name: acidentes_seriessexo; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_seriessexo (id, sexo_id, ano, acidentes) FROM stdin;
1	1	1997	10.15
2	2	1997	3.68
3	1	1998	22.66
4	2	1998	9.40
5	1	2001	19.15
6	2	2001	8.47
7	1	2002	20.96
8	2	2002	9.59
9	1	2003	20.82
10	2	2003	9.70
11	1	2004	23.20
12	2	2004	10.60
13	1	2005	22.98
14	2	2005	10.55
15	1	2006	23.35
16	2	2006	11.12
17	1	2007	21.77
18	2	2007	10.53
19	1	2008	20.86
20	2	2008	10.24
\.


--
-- Name: acidentes_seriessexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_seriessexo_id_seq', 20, true);


--
-- Data for Name: acidentes_seriesuniaofederacao; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_seriesuniaofederacao (id, uf_id, ano, acidentes) FROM stdin;
1	1	1997	16.94
2	2	1997	9.32
3	3	1997	14.29
4	4	1997	5.51
5	5	1997	14.57
6	6	1997	10.55
7	7	1997	12.24
8	8	1997	5.32
9	9	1997	3.37
10	10	1997	7.02
11	11	1997	8.82
12	12	1997	7.98
13	13	1997	13.04
14	14	1997	21.17
15	15	1997	10.76
16	16	1997	13.82
17	17	1997	24.79
18	18	1997	19.63
19	19	1997	13.40
20	20	1997	30.31
21	21	1997	26.21
22	22	1997	29.03
23	23	1997	28.76
24	24	1997	19.44
25	25	1997	18.22
26	26	1997	16.81
27	27	1997	8.61
28	1	1998	16.36
29	2	1998	7.90
30	3	1998	13.26
31	4	1998	6.38
32	5	1998	13.61
33	6	1998	10.16
34	7	1998	11.30
35	8	1998	5.27
36	9	1998	3.02
37	10	1998	6.86
38	11	1998	8.81
39	12	1998	6.69
40	13	1998	10.27
41	14	1998	19.20
42	15	1998	9.50
43	16	1998	10.52
44	17	1998	21.28
45	18	1998	16.49
46	19	1998	11.35
47	20	1998	27.47
48	21	1998	23.61
49	22	1998	28.29
50	23	1998	24.03
51	24	1998	15.43
52	25	1998	16.48
53	26	1998	14.85
54	27	1998	8.31
55	1	1999	18.27
56	2	1999	7.35
57	3	1999	13.40
58	4	1999	6.49
59	5	1999	16.48
60	6	1999	11.11
61	7	1999	14.38
62	8	1999	6.06
63	9	1999	5.09
64	10	1999	7.60
65	11	1999	8.86
66	12	1999	6.00
67	13	1999	11.75
68	14	1999	20.26
69	15	1999	8.37
70	16	1999	9.51
71	17	1999	21.67
72	18	1999	15.93
73	19	1999	11.64
74	20	1999	25.50
75	21	1999	21.29
76	22	1999	28.86
77	23	1999	23.69
78	24	1999	17.26
79	25	1999	17.12
80	26	1999	15.04
81	27	1999	8.67
82	1	2000	24.00
83	2	2000	10.22
84	3	2000	16.74
85	4	2000	7.67
86	5	2000	16.39
87	6	2000	9.94
88	7	2000	14.03
89	8	2000	7.59
90	9	2000	5.59
91	10	2000	8.51
92	11	2000	8.31
93	12	2000	8.10
94	13	2000	11.17
95	14	2000	22.62
96	15	2000	9.89
97	16	2000	14.30
98	17	2000	18.84
99	18	2000	17.58
100	19	2000	11.48
101	20	2000	22.37
102	21	2000	20.94
103	22	2000	31.71
104	23	2000	27.25
105	24	2000	20.68
106	25	2000	18.99
107	26	2000	15.66
108	27	2000	11.01
109	1	2001	17.64
110	2	2001	7.13
111	3	2001	13.05
112	4	2001	5.27
113	5	2001	15.06
114	6	2001	11.25
115	7	2001	12.01
116	8	2001	5.87
117	9	2001	3.94
118	10	2001	6.10
119	11	2001	7.79
120	12	2001	7.61
121	13	2001	9.65
122	14	2001	15.21
123	15	2001	6.67
124	16	2001	8.72
125	17	2001	15.45
126	18	2001	17.22
127	19	2001	8.63
128	20	2001	17.87
129	21	2001	15.97
130	22	2001	25.43
131	23	2001	20.84
132	24	2001	16.71
133	25	2001	15.49
134	26	2001	13.98
135	27	2001	8.82
136	1	2002	17.51
137	2	2002	8.61
138	3	2002	14.41
139	4	2002	5.15
140	5	2002	16.11
141	6	2002	9.41
142	7	2002	8.57
143	8	2002	6.53
144	9	2002	4.38
145	10	2002	6.14
146	11	2002	8.39
147	12	2002	7.35
148	13	2002	10.81
149	14	2002	16.00
150	15	2002	8.66
151	16	2002	10.75
152	17	2002	15.18
153	18	2002	18.09
154	19	2002	11.25
155	20	2002	20.17
156	21	2002	18.00
157	22	2002	25.27
158	23	2002	22.28
159	24	2002	17.82
160	25	2002	15.78
161	26	2002	14.54
162	27	2002	9.99
163	1	2003	17.29
164	2	2003	8.18
165	3	2003	15.12
166	4	2003	5.04
167	5	2003	16.57
168	6	2003	7.65
169	7	2003	9.51
170	8	2003	8.39
171	9	2003	5.03
172	10	2003	6.49
173	11	2003	9.19
174	12	2003	7.59
175	13	2003	11.38
176	14	2003	17.34
177	15	2003	7.79
178	16	2003	11.15
179	17	2003	15.72
180	18	2003	17.51
181	19	2003	10.95
182	20	2003	19.36
183	21	2003	18.13
184	22	2003	22.95
185	23	2003	22.04
186	24	2003	17.62
187	25	2003	16.83
188	26	2003	16.18
189	27	2003	9.42
190	1	2004	17.91
191	2	2004	8.89
192	3	2004	16.70
193	4	2004	5.89
194	5	2004	19.44
195	6	2004	8.87
196	7	2004	17.79
197	8	2004	8.81
198	9	2004	5.58
199	10	2004	8.08
200	11	2004	11.98
201	12	2004	7.85
202	13	2004	13.10
203	14	2004	21.70
204	15	2004	9.38
205	16	2004	11.47
206	17	2004	17.26
207	18	2004	18.70
208	19	2004	12.95
209	20	2004	21.13
210	21	2004	19.56
211	22	2004	24.28
212	23	2004	23.01
213	24	2004	19.03
214	25	2004	17.71
215	26	2004	16.63
216	27	2004	11.17
217	1	2005	17.11
218	2	2005	8.49
219	3	2005	17.56
220	4	2005	3.58
221	5	2005	17.64
222	6	2005	9.26
223	7	2005	15.10
224	8	2005	11.89
225	9	2005	5.53
226	10	2005	8.01
227	11	2005	12.47
228	12	2005	9.11
229	13	2005	13.64
230	14	2005	21.14
231	15	2005	9.91
232	16	2005	11.47
233	17	2005	17.37
234	18	2005	19.80
235	19	2005	13.49
236	20	2005	21.38
237	21	2005	19.82
238	22	2005	23.93
239	23	2005	22.60
240	24	2005	19.04
241	25	2005	16.83
242	26	2005	16.77
243	27	2005	11.14
244	1	2006	15.34
245	2	2006	9.07
246	3	2006	18.91
247	4	2006	3.84
248	5	2006	18.87
249	6	2006	11.17
250	7	2006	9.38
251	8	2006	9.95
252	9	2006	5.81
253	10	2006	7.59
254	11	2006	14.31
255	12	2006	9.03
256	13	2006	14.45
257	14	2006	27.20
258	15	2006	9.89
259	16	2006	11.57
260	17	2006	16.57
261	18	2006	19.91
262	19	2006	14.16
263	20	2006	21.70
264	21	2006	20.09
265	22	2006	21.96
266	23	2006	22.59
267	24	2006	19.21
268	25	2006	18.44
269	26	2006	17.27
270	27	2006	10.99
271	1	2007	13.19
272	2	2007	6.71
273	3	2007	18.83
274	4	2007	5.62
275	5	2007	17.26
276	6	2007	13.09
277	7	2007	9.15
278	8	2007	8.71
279	9	2007	5.15
280	10	2007	7.24
281	11	2007	14.13
282	12	2007	8.70
283	13	2007	12.93
284	14	2007	27.08
285	15	2007	9.29
286	16	2007	10.43
287	17	2007	16.41
288	18	2007	19.05
289	19	2007	13.32
290	20	2007	19.87
291	21	2007	19.92
292	22	2007	18.66
293	23	2007	19.83
294	24	2007	21.47
295	25	2007	19.43
296	26	2007	17.31
297	27	2007	9.41
298	1	2008	14.65
299	2	2008	6.45
300	3	2008	17.45
301	4	2008	5.07
302	5	2008	15.03
303	6	2008	9.10
304	7	2008	7.91
305	8	2008	9.40
306	9	2008	4.63
307	10	2008	6.91
308	11	2008	16.28
309	12	2008	7.47
310	13	2008	12.41
311	14	2008	25.20
312	15	2008	8.63
313	16	2008	9.67
314	17	2008	15.55
315	18	2008	18.29
316	19	2008	13.38
317	20	2008	19.84
318	21	2008	18.74
319	22	2008	17.75
320	23	2008	20.45
321	24	2008	20.24
322	25	2008	18.92
323	26	2008	15.86
324	27	2008	10.10
\.


--
-- Name: acidentes_seriesuniaofederacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_seriesuniaofederacao_id_seq', 324, true);


--
-- Data for Name: acidentes_sexo; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_sexo (id, sigla, descricao) FROM stdin;
1	M	Masculino
2	F	Feminino
\.


--
-- Name: acidentes_sexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_sexo_id_seq', 2, true);


--
-- Data for Name: acidentes_uniaofederacao; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY acidentes_uniaofederacao (id, sigla, nome) FROM stdin;
1	RO	Rondonia
2	AC	Acre
3	AM	Amazonas
4	RR	Roraima
5	PA	Para
6	AP	Amapa
7	TO	Tocantins
8	MA	Maranhao
9	PI	Piaui
10	CE	Ceara
11	RN	Rio Grande do Norte
12	PB	Paraiba
13	PE	Pernambuco
14	AL	Alagoas
15	SE	Sergipe
16	BA	Bahia
17	MG	Minas Gerais
18	ES	Espirito Santo
19	RJ	Rio de Janeiro
20	SP	Sao Paulo
21	PR	Parana
22	SC	Santa Catarina
23	RS	Rio Grande do Sul
24	MS	Mato Grosso do Sul
25	MT	Mato Grosso
26	GO	Goias
27	DF	Distrito Federal
\.


--
-- Name: acidentes_uniaofederacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('acidentes_uniaofederacao_id_seq', 27, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add pais	7	add_pais
20	Can change pais	7	change_pais
21	Can delete pais	7	delete_pais
22	Can add regiao	8	add_regiao
23	Can change regiao	8	change_regiao
24	Can delete regiao	8	delete_regiao
25	Can add uniao federacao	9	add_uniaofederacao
26	Can change uniao federacao	9	change_uniaofederacao
27	Can delete uniao federacao	9	delete_uniaofederacao
28	Can add sexo	10	add_sexo
29	Can change sexo	10	change_sexo
30	Can delete sexo	10	delete_sexo
34	Can add series regioes	12	add_seriesregioes
35	Can change series regioes	12	change_seriesregioes
36	Can delete series regioes	12	delete_seriesregioes
37	Can add series uniao federacao	13	add_seriesuniaofederacao
38	Can change series uniao federacao	13	change_seriesuniaofederacao
39	Can delete series uniao federacao	13	delete_seriesuniaofederacao
40	Can add series sexo	14	add_seriessexo
41	Can change series sexo	14	change_seriessexo
42	Can delete series sexo	14	delete_seriessexo
43	Can add series pais	15	add_seriespais
44	Can change series pais	15	change_seriespais
45	Can delete series pais	15	delete_seriespais
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('auth_permission_id_seq', 45, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$87o2craH3swJ$vgOBZyI0H4+56hf34bmnGWeBITiQjCvbj/mt/zq7GAg=	2014-09-01 14:34:13.339289-03	t	avdat			iuli.zacarias@gmail.com	t	t	2014-09-01 10:26:44.491287-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	pais	acidentes	pais
8	regiao	acidentes	regiao
9	uniao federacao	acidentes	uniaofederacao
10	sexo	acidentes	sexo
12	series regioes	acidentes	seriesregioes
13	series uniao federacao	acidentes	seriesuniaofederacao
14	series sexo	acidentes	seriessexo
15	series pais	acidentes	seriespais
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdat
--

SELECT pg_catalog.setval('django_content_type_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: avdat
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
b3zxiumx7eo2ejtmkqrtz2b9zkqfymqf	NWMwZWMwMDY3OGE0Y2FiMDk1NjQzZGQwN2Y4ZTI0MDgyZmVhYzBhNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-15 14:34:13.347616-03
\.


--
-- Name: acidentes_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_pais
    ADD CONSTRAINT acidentes_pais_pkey PRIMARY KEY (id);


--
-- Name: acidentes_regiao_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_regiao
    ADD CONSTRAINT acidentes_regiao_pkey PRIMARY KEY (id);


--
-- Name: acidentes_seriespais_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_seriespais
    ADD CONSTRAINT acidentes_seriespais_pkey PRIMARY KEY (id);


--
-- Name: acidentes_seriesregioes_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_seriesregioes
    ADD CONSTRAINT acidentes_seriesregioes_pkey PRIMARY KEY (id);


--
-- Name: acidentes_seriessexo_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_seriessexo
    ADD CONSTRAINT acidentes_seriessexo_pkey PRIMARY KEY (id);


--
-- Name: acidentes_seriesuniaofederacao_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_seriesuniaofederacao
    ADD CONSTRAINT acidentes_seriesuniaofederacao_pkey PRIMARY KEY (id);


--
-- Name: acidentes_sexo_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_sexo
    ADD CONSTRAINT acidentes_sexo_pkey PRIMARY KEY (id);


--
-- Name: acidentes_uniaofederacao_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY acidentes_uniaofederacao
    ADD CONSTRAINT acidentes_uniaofederacao_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: avdat; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: acidentes_seriespais_pais_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX acidentes_seriespais_pais_id ON acidentes_seriespais USING btree (pais_id);


--
-- Name: acidentes_seriesregioes_regiao_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX acidentes_seriesregioes_regiao_id ON acidentes_seriesregioes USING btree (regiao_id);


--
-- Name: acidentes_seriessexo_sexo_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX acidentes_seriessexo_sexo_id ON acidentes_seriessexo USING btree (sexo_id);


--
-- Name: acidentes_seriesuniaofederacao_uf_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX acidentes_seriesuniaofederacao_uf_id ON acidentes_seriesuniaofederacao USING btree (uf_id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: avdat; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: acidentes_seriespais_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriespais
    ADD CONSTRAINT acidentes_seriespais_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES acidentes_pais(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acidentes_seriesregioes_regiao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriesregioes
    ADD CONSTRAINT acidentes_seriesregioes_regiao_id_fkey FOREIGN KEY (regiao_id) REFERENCES acidentes_regiao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acidentes_seriessexo_sexo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriessexo
    ADD CONSTRAINT acidentes_seriessexo_sexo_id_fkey FOREIGN KEY (sexo_id) REFERENCES acidentes_sexo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acidentes_seriesuniaofederacao_uf_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY acidentes_seriesuniaofederacao
    ADD CONSTRAINT acidentes_seriesuniaofederacao_uf_id_fkey FOREIGN KEY (uf_id) REFERENCES acidentes_uniaofederacao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: avdat
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

