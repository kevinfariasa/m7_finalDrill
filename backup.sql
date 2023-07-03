toc.dat                                                                                             0000600 0004000 0002000 00000016311 14447620133 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           #                {            db_bootcamp    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    17956    db_bootcamp    DATABASE     ~   CREATE DATABASE db_bootcamp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE db_bootcamp;
                postgres    false         �            1259    38807 	   bootcamps    TABLE       CREATE TABLE public.bootcamps (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    cue integer NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.bootcamps;
       public         heap    postgres    false         �            1259    38806    bootcamps_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bootcamps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.bootcamps_id_seq;
       public          postgres    false    221                    0    0    bootcamps_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.bootcamps_id_seq OWNED BY public.bootcamps.id;
          public          postgres    false    220         �            1259    38815    user_bootcamp    TABLE     �   CREATE TABLE public.user_bootcamp (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer NOT NULL,
    "bootcampId" integer NOT NULL
);
 !   DROP TABLE public.user_bootcamp;
       public         heap    postgres    false         �            1259    38797    users    TABLE     H  CREATE TABLE public.users (
    id integer NOT NULL,
    "firstName" character varying(50) NOT NULL,
    "lastName" character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    status boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    38796    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    219                    0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    218         t           2604    38810    bootcamps id    DEFAULT     l   ALTER TABLE ONLY public.bootcamps ALTER COLUMN id SET DEFAULT nextval('public.bootcamps_id_seq'::regclass);
 ;   ALTER TABLE public.bootcamps ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221         r           2604    38800    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219                   0    38807 	   bootcamps 
   TABLE DATA           Z   COPY public.bootcamps (id, title, cue, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    221       3346.dat           0    38815    user_bootcamp 
   TABLE DATA           Y   COPY public.user_bootcamp ("createdAt", "updatedAt", "userId", "bootcampId") FROM stdin;
    public          postgres    false    222       3347.dat           0    38797    users 
   TABLE DATA           e   COPY public.users (id, "firstName", "lastName", email, status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    219       3344.dat            0    0    bootcamps_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.bootcamps_id_seq', 3, true);
          public          postgres    false    220                    0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    218         |           2606    38814    bootcamps bootcamps_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.bootcamps
    ADD CONSTRAINT bootcamps_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.bootcamps DROP CONSTRAINT bootcamps_pkey;
       public            postgres    false    221         ~           2606    38819     user_bootcamp user_bootcamp_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT user_bootcamp_pkey PRIMARY KEY ("userId", "bootcampId");
 J   ALTER TABLE ONLY public.user_bootcamp DROP CONSTRAINT user_bootcamp_pkey;
       public            postgres    false    222    222         v           2606    38833    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    219         x           2606    38835    users users_email_key1 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key1;
       public            postgres    false    219         z           2606    38803    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219                    2606    38825 +   user_bootcamp user_bootcamp_bootcampId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT "user_bootcamp_bootcampId_fkey" FOREIGN KEY ("bootcampId") REFERENCES public.bootcamps(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.user_bootcamp DROP CONSTRAINT "user_bootcamp_bootcampId_fkey";
       public          postgres    false    221    222    3196         �           2606    38820 '   user_bootcamp user_bootcamp_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT "user_bootcamp_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.user_bootcamp DROP CONSTRAINT "user_bootcamp_userId_fkey";
       public          postgres    false    219    3194    222                                                                                                                                                                                                                                                                                                                               3346.dat                                                                                            0000600 0004000 0002000 00000001226 14447620133 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Introduciendo El Bootcamp De React	10	React es la librería más usada en JavaScript para el desarrollo de interfaces.	2023-06-30 18:06:57.21+00	2023-06-30 18:06:57.21+00
2	Bootcamp Desarrollo Web Full Stack.	12	Crearás aplicaciones web utilizando las tecnologías y lenguajes más actuales y populares, como: JavaScript, nodeJS, Angular, MongoDB, ExpressJS.	2023-06-30 18:07:26.404+00	2023-06-30 18:07:26.404+00
3	Bootcamp Big Data, Inteligencia Artificial & Machine Learning.	18	Domina Data Science, y todo el ecosistema de lenguajes y herramientas de Big Data, e intégralos con modelos avanzados	2023-06-30 18:08:00.768+00	2023-06-30 18:08:00.768+00
\.


                                                                                                                                                                                                                                                                                                                                                                          3347.dat                                                                                            0000600 0004000 0002000 00000000537 14447620133 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2023-06-30 18:14:11.319+00	2023-06-30 18:14:11.319+00	1	1
2023-06-30 18:14:20.423+00	2023-06-30 18:14:20.423+00	2	1
2023-06-30 18:14:56.929+00	2023-06-30 18:14:56.929+00	1	2
2023-06-30 18:15:13.231+00	2023-06-30 18:15:13.231+00	1	3
2023-06-30 18:15:20.09+00	2023-06-30 18:15:20.09+00	2	3
2023-06-30 18:15:29.289+00	2023-06-30 18:15:29.289+00	3	3
\.


                                                                                                                                                                 3344.dat                                                                                            0000600 0004000 0002000 00000000620 14447620133 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Santiago	Mejías	santiago.mejias@correo.com	t	2023-06-30 18:10:02.068+00	2023-06-30 18:10:02.068+00
3	Lucas	Rojas	lucas.rojas@correo.com	t	2023-06-30 18:10:19.805+00	2023-06-30 18:10:19.805+00
4	Facundo	Fernandez	facundo.fernandez@correo.com	t	2023-06-30 18:11:02.572+00	2023-06-30 18:11:02.572+00
1	Pedro	Sánchez	mateo.diaz@correo.com	f	2023-06-30 18:08:54.575+00	2023-06-30 18:18:32.389+00
\.


                                                                                                                restore.sql                                                                                         0000600 0004000 0002000 00000014406 14447620133 0015375 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

DROP DATABASE db_bootcamp;
--
-- Name: db_bootcamp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_bootcamp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE db_bootcamp OWNER TO postgres;

\connect db_bootcamp

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
-- Name: bootcamps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bootcamps (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    cue integer NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.bootcamps OWNER TO postgres;

--
-- Name: bootcamps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bootcamps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bootcamps_id_seq OWNER TO postgres;

--
-- Name: bootcamps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bootcamps_id_seq OWNED BY public.bootcamps.id;


--
-- Name: user_bootcamp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_bootcamp (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer NOT NULL,
    "bootcampId" integer NOT NULL
);


ALTER TABLE public.user_bootcamp OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "firstName" character varying(50) NOT NULL,
    "lastName" character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    status boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
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
-- Name: bootcamps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bootcamps ALTER COLUMN id SET DEFAULT nextval('public.bootcamps_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: bootcamps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bootcamps (id, title, cue, description, "createdAt", "updatedAt") FROM stdin;
\.
COPY public.bootcamps (id, title, cue, description, "createdAt", "updatedAt") FROM '$$PATH$$/3346.dat';

--
-- Data for Name: user_bootcamp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_bootcamp ("createdAt", "updatedAt", "userId", "bootcampId") FROM stdin;
\.
COPY public.user_bootcamp ("createdAt", "updatedAt", "userId", "bootcampId") FROM '$$PATH$$/3347.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, "firstName", "lastName", email, status, "createdAt", "updatedAt") FROM stdin;
\.
COPY public.users (id, "firstName", "lastName", email, status, "createdAt", "updatedAt") FROM '$$PATH$$/3344.dat';

--
-- Name: bootcamps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bootcamps_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: bootcamps bootcamps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bootcamps
    ADD CONSTRAINT bootcamps_pkey PRIMARY KEY (id);


--
-- Name: user_bootcamp user_bootcamp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT user_bootcamp_pkey PRIMARY KEY ("userId", "bootcampId");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: user_bootcamp user_bootcamp_bootcampId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT "user_bootcamp_bootcampId_fkey" FOREIGN KEY ("bootcampId") REFERENCES public.bootcamps(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_bootcamp user_bootcamp_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT "user_bootcamp_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          