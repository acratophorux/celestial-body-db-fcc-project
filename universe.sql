--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(24),
    description text,
    age_in_millions_of_years numeric NOT NULL,
    stars_in_billions integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(24),
    description text,
    age_in_millions_of_years numeric NOT NULL,
    no_of_bars integer NOT NULL,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(24),
    description text,
    age_in_millions_of_years numeric NOT NULL,
    no_of_moons integer,
    has_life boolean,
    star_id integer,
    planet_types_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(24) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(24),
    description text,
    age_in_millions_of_years numeric NOT NULL,
    no_of_planets integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral', 13600, 400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy to the Milky Way', 1000, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 9000, 40);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Closest active galaxy to Earth', 13200, 100);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Classic spiral galaxy with prominent arms', 11000, 100);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unusual galaxy with a large central bulge', 13250, 100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', 4500, 0, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger and inner satellite of Mars', 4503, 0, false, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller and outer satellite of Mars', 4503, 0, false, 2);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 4003, 0, true, 6);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Irregular satellite of Saturn', 4500, 0, false, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'Irregularly shaped moon of Saturn', 4500, 0, false, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Third-largest moon of Saturn', 4567, 0, true, 6);
INSERT INTO public.moon VALUES (18, 'Rhea', 'Second-largest moon of Saturn', 4000, 0, true, 6);
INSERT INTO public.moon VALUES (19, 'Dione', 'Fourth-largest moon of Saturn', 4000, 0, true, 6);
INSERT INTO public.moon VALUES (20, 'Tethys', 'Mid-sized moon of Saturn', 4560, 0, true, 6);
INSERT INTO public.moon VALUES (4, 'Io', 'Most volcanically active body in the Solar System', 4500, 0, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Smoothest solid object in the Solar System', 4500, 0, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System', 4500, 0, true, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Most heavily cratered object in the Solar System', 4500, 0, true, 8);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Geologically active, covered in fresh ice', 1000, 0, true, 9);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Smallest astronomical body known to be rounded', 4100, 0, true, 10);
INSERT INTO public.moon VALUES (11, 'Triton', 'Largest moon of Neptune', 4503, 0, true, 11);
INSERT INTO public.moon VALUES (12, 'Charon', 'Largest moon of Pluto', 4500, 0, true, 12);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Smallest of Uranus''s five round satellites', 4500, 0, true, 13);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Outermost major moon of Uranus', 4500, 0, true, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in our solar system', 4503, 0, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet in our solar system', 4503, 0, false, 2, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 4543, 1, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet', 4603, 2, false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in our solar system', 4603, 79, false, 3, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its prominent ring system', 4503, 82, false, 3, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with a tilted axis', 4503, 27, false, 4, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Windiest planet in our solar system', 4503, 14, false, 6, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper belt', 4600, 5, false, 6, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'First Earth-sized planet in habitable zone', 4000, 0, false, 7, 1);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'First exoplanet seen transiting its star', 3800, 0, false, 7, 2);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Potentially habitable exoplanet', 7600, 0, false, 5, 1);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 'Closest known exoplanet to Solar System', 4850, 0, false, 5, 1);
INSERT INTO public.planet VALUES (14, '51 Pegasi b', 'First exoplanet discovered around a Sun-like star', 6100, 0, false, 4, 2);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces, primarily composed of silicate rocks or metals.');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'Massive planets composed mostly of hydrogen and helium, with a small rocky core.');
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Planets with a significant amount of ice, water, methane, and ammonia, with a rocky core.');
INSERT INTO public.planet_types VALUES (4, 'Dwarf Planet', 'Smaller celestial bodies that orbit the Sun, but have not cleared their orbital paths.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar system''s star', 4600, 8, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun', 4850, 3, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in Orion', 8, 0, 3);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in Earth''s night sky', 242, 0, 4);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Primary star of Alpha Centauri system', 5300, 1, 5);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright star in Lyra constellation', 455, 0, 6);
INSERT INTO public.star VALUES (7, 'Trappist-1', 'Ultra-cool red dwarf star', 7600, 7, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet_types unique_planet_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_type_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet fk_planet_types; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_types FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

