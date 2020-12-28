--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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

ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.articles_id_seq;
DROP TABLE public.articles;
DROP TABLE public.alembic_version;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    title character varying,
    content text,
    date date
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
d4c02d920e23
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title, content, date) FROM stdin;
1	Premier article	\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam odio risus, elementum a nisi a, hendrerit viverra lorem. Vivamus elit ligula, fermentum iaculis dignissim ut, consectetur porta neque. Nunc sagittis odio dui, sed pellentesque ante malesuada non. Nulla facilisi. Duis mattis semper sem, eu pharetra lectus elementum ac. Quisque porta, lacus feugiat aliquam commodo, enim dui vestibulum enim, in dictum justo metus eget risus. Sed at malesuada justo, semper tempor quam. Mauris bibendum magna at faucibus commodo. Sed congue massa metus, id gravida mi fringilla eu. Sed et turpis eget tellus condimentum vestibulum eu nec dolor. Praesent sed velit at nisi lobortis finibus. Suspendisse eleifend augue in tellus sodales, sed ultrices eros fermentum. Donec sodales massa et sapien bibendum, eu auctor eros iaculis. Donec in neque eu lacus consequat cursus non vitae orci. Nullam imperdiet pretium metus, vitae interdum leo fringilla a. Sed a purus eget nulla viverra tempor.\r\n\r\nNam felis turpis, porttitor non cursus ut, aliquet eu felis. Donec ultrices ex a sollicitudin laoreet. Phasellus feugiat sagittis eros, ac feugiat purus pellentesque a. Proin egestas tempus mi, vitae euismod nunc sodales interdum. Quisque non justo vitae metus rhoncus sollicitudin eu ut nulla. Praesent lobortis, leo id cursus congue, nisl sem viverra tellus, et tristique odio massa id mauris. Fusce efficitur nec arcu eget mollis. Etiam libero libero, tempor non facilisis id, convallis ac odio. Mauris felis velit, malesuada semper nisi quis, varius dignissim velit. Integer semper justo eget felis viverra laoreet. Vivamus enim eros, auctor at luctus a, egestas a ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer odio odio, sagittis ac porta nec, euismod a tortor. Nulla commodo turpis quis luctus semper. Nunc iaculis scelerisque arcu, eget tristique diam. Nulla fermentum metus in pellentesque sollicitudin.\r\n\r\nPellentesque sollicitudin congue interdum. Nunc porta rutrum libero non aliquam. Aenean luctus ultrices lectus. Nunc hendrerit dictum dolor eu elementum. Suspendisse arcu ex, ornare at purus nec, molestie rutrum velit. Phasellus ac ullamcorper sem. Nulla euismod dolor felis, sed posuere ex eleifend non. Phasellus in quam porta neque finibus pharetra sit amet vitae turpis. Duis eu gravida ante, ut malesuada arcu. Aenean pharetra lectus turpis. In quis nunc massa. Donec congue molestie ultricies. Nullam vel turpis auctor, rutrum diam eget, maximus quam. Donec dui felis, faucibus et malesuada eget, feugiat mattis urna.\r\n\r\nMauris id ornare nunc. Nunc rutrum urna felis, non pulvinar mi viverra mattis. Cras vel metus fermentum, sollicitudin ipsum et, accumsan purus. Maecenas laoreet odio non vestibulum feugiat. Nunc lacinia quis turpis sit amet molestie. Morbi lorem leo, molestie id aliquam a, egestas eget ex. Vestibulum mauris ante, eleifend eget efficitur sed, porta ut nibh. Nullam sollicitudin diam eu ex tempus mollis. Phasellus mattis urna non sapien tempus viverra. Aliquam at rhoncus eros. Sed fermentum eros mauris, at euismod velit maximus vitae. Fusce vel consectetur nibh.\r\n\r\nFusce nulla augue, laoreet vitae sagittis sed, scelerisque at eros. Donec in tempus ante. Aliquam in ipsum mollis, rutrum nisl a, tristique nunc. Pellentesque eget tempus justo. Vestibulum aliquet ante et lacus mollis placerat. Phasellus mauris magna, aliquet eget neque vitae, sagittis condimentum libero. Proin et suscipit nibh. Donec id pulvinar sem. Pellentesque id neque hendrerit, volutpat sapien ac, tincidunt eros. Sed tempus viverra ipsum eget ultricies. Ut faucibus dui at condimentum molestie. 	2020-12-03
2	Second article	\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam odio risus, elementum a nisi a, hendrerit viverra lorem. Vivamus elit ligula, fermentum iaculis dignissim ut, consectetur porta neque. Nunc sagittis odio dui, sed pellentesque ante malesuada non. Nulla facilisi. Duis mattis semper sem, eu pharetra lectus elementum ac. Quisque porta, lacus feugiat aliquam commodo, enim dui vestibulum enim, in dictum justo metus eget risus. Sed at malesuada justo, semper tempor quam. Mauris bibendum magna at faucibus commodo. Sed congue massa metus, id gravida mi fringilla eu. Sed et turpis eget tellus condimentum vestibulum eu nec dolor. Praesent sed velit at nisi lobortis finibus. Suspendisse eleifend augue in tellus sodales, sed ultrices eros fermentum. Donec sodales massa et sapien bibendum, eu auctor eros iaculis. Donec in neque eu lacus consequat cursus non vitae orci. Nullam imperdiet pretium metus, vitae interdum leo fringilla a. Sed a purus eget nulla viverra tempor.\r\n\r\nNam felis turpis, porttitor non cursus ut, aliquet eu felis. Donec ultrices ex a sollicitudin laoreet. Phasellus feugiat sagittis eros, ac feugiat purus pellentesque a. Proin egestas tempus mi, vitae euismod nunc sodales interdum. Quisque non justo vitae metus rhoncus sollicitudin eu ut nulla. Praesent lobortis, leo id cursus congue, nisl sem viverra tellus, et tristique odio massa id mauris. Fusce efficitur nec arcu eget mollis. Etiam libero libero, tempor non facilisis id, convallis ac odio. Mauris felis velit, malesuada semper nisi quis, varius dignissim velit. Integer semper justo eget felis viverra laoreet. Vivamus enim eros, auctor at luctus a, egestas a ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer odio odio, sagittis ac porta nec, euismod a tortor. Nulla commodo turpis quis luctus semper. Nunc iaculis scelerisque arcu, eget tristique diam. Nulla fermentum metus in pellentesque sollicitudin.\r\n\r\nPellentesque sollicitudin congue interdum. Nunc porta rutrum libero non aliquam. Aenean luctus ultrices lectus. Nunc hendrerit dictum dolor eu elementum. Suspendisse arcu ex, ornare at purus nec, molestie rutrum velit. Phasellus ac ullamcorper sem. Nulla euismod dolor felis, sed posuere ex eleifend non. Phasellus in quam porta neque finibus pharetra sit amet vitae turpis. Duis eu gravida ante, ut malesuada arcu. Aenean pharetra lectus turpis. In quis nunc massa. Donec congue molestie ultricies. Nullam vel turpis auctor, rutrum diam eget, maximus quam. Donec dui felis, faucibus et malesuada eget, feugiat mattis urna.\r\n\r\nMauris id ornare nunc. Nunc rutrum urna felis, non pulvinar mi viverra mattis. Cras vel metus fermentum, sollicitudin ipsum et, accumsan purus. Maecenas laoreet odio non vestibulum feugiat. Nunc lacinia quis turpis sit amet molestie. Morbi lorem leo, molestie id aliquam a, egestas eget ex. Vestibulum mauris ante, eleifend eget efficitur sed, porta ut nibh. Nullam sollicitudin diam eu ex tempus mollis. Phasellus mattis urna non sapien tempus viverra. Aliquam at rhoncus eros. Sed fermentum eros mauris, at euismod velit maximus vitae. Fusce vel consectetur nibh.\r\n\r\nFusce nulla augue, laoreet vitae sagittis sed, scelerisque at eros. Donec in tempus ante. Aliquam in ipsum mollis, rutrum nisl a, tristique nunc. Pellentesque eget tempus justo. Vestibulum aliquet ante et lacus mollis placerat. Phasellus mauris magna, aliquet eget neque vitae, sagittis condimentum libero. Proin et suscipit nibh. Donec id pulvinar sem. Pellentesque id neque hendrerit, volutpat sapien ac, tincidunt eros. Sed tempus viverra ipsum eget ultricies. Ut faucibus dui at condimentum molestie. 	2020-12-03
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

