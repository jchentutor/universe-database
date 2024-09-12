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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    planet_id integer,
    name character varying(255) NOT NULL,
    diameter integer NOT NULL,
    mass numeric,
    is_rocky boolean,
    description text,
    orbital_period numeric,
    is_active boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance numeric NOT NULL,
    is_observable boolean,
    age integer,
    description text,
    number_of_stars integer,
    number_of_planets integer,
    is_expanding boolean,
    has_black_hole boolean
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
    planet_id integer,
    name character varying(255) NOT NULL,
    radius integer NOT NULL,
    surface_area numeric,
    has_water boolean,
    description text,
    craters_count integer,
    surface_temperature integer,
    is_icy boolean,
    is_volcanic boolean
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
    star_id integer,
    name character varying(255) NOT NULL,
    diameter integer NOT NULL,
    orbit_period numeric,
    is_inhabitable boolean,
    description text,
    number_of_moons integer,
    average_temperature integer,
    has_rings boolean,
    is_gaseous boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(255) NOT NULL,
    mass numeric NOT NULL,
    temperature integer,
    is_hospitable boolean,
    description text,
    number_of_planets integer,
    brightness integer,
    is_binary boolean,
    is_variable boolean
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 1, 'Ceres', 940, 940000000000000000000, true, 'The largest asteroid in the asteroid belt.', 1680, true);
INSERT INTO public.asteroid VALUES (2, 2, 'Pallas', 512, 42000000000000000000, true, 'The second-largest asteroid in the asteroid belt.', 687, false);
INSERT INTO public.asteroid VALUES (3, 3, 'Vesta', 525, 260000000000000000000, true, 'A large asteroid with a distinct surface structure.', 1240, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, 13000, 'Our home galaxy. A barred spiral galaxy.', 100000000, 1000, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, true, 10000, 'Nearest spiral galaxy to the Milky Way.', 200000000, 2000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, true, 8000, 'Small spiral galaxy in the Local Group.', 50000000, 500, true, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, false, 7000, 'Spiral galaxy with a prominent ring.', 80000000, 800, false, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 21000000, false, 6000, 'Spiral galaxy in the constellation Ursa Major.', 90000000, 900, true, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 28000000, true, 5000, 'Bright spiral galaxy with a large central bulge.', 60000000, 600, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 1737, 37930000, true, 'Earth’s only natural satellite.', 30000, -53, false, false);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 11, 13500, false, 'The larger and closer moon of Mars.', 1000, -40, false, true);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 6, 3070, false, 'The smaller and farther moon of Mars.', 500, -60, false, false);
INSERT INTO public.moon VALUES (4, 3, 'Venus Moon 1', 600, 570000, true, 'A moon of Venus.', 6000, 450, true, false);
INSERT INTO public.moon VALUES (5, 4, 'Io', 1821, 42000000, true, 'One of Jupiter’s moons, known for its volcanic activity.', 20000, -143, false, true);
INSERT INTO public.moon VALUES (6, 4, 'Europa', 1560, 45000000, true, 'A moon of Jupiter, known for its ice-covered surface.', 15000, -160, true, false);
INSERT INTO public.moon VALUES (7, 4, 'Ganymede', 2631, 87000000, true, 'The largest moon of Jupiter.', 18000, -130, false, false);
INSERT INTO public.moon VALUES (8, 4, 'Callisto', 2400, 76000000, true, 'A heavily cratered moon of Jupiter.', 20000, -121, true, false);
INSERT INTO public.moon VALUES (9, 5, 'Saturn Moon 1', 500, 2000000, true, 'A moon of Saturn.', 5000, -180, true, true);
INSERT INTO public.moon VALUES (10, 5, 'Titan', 2575, 86000000, true, 'The largest moon of Saturn, with a thick atmosphere.', 40000, -180, true, false);
INSERT INTO public.moon VALUES (11, 6, 'Tethys', 1060, 3200000, true, 'A moon of Saturn.', 2500, -185, false, false);
INSERT INTO public.moon VALUES (12, 6, 'Dione', 1120, 3100000, true, 'Another moon of Saturn.', 3000, -180, false, true);
INSERT INTO public.moon VALUES (13, 7, 'Ariel', 578, 1600000, true, 'A moon of Uranus.', 1500, -190, false, true);
INSERT INTO public.moon VALUES (14, 7, 'Miranda', 471, 1400000, true, 'A moon of Uranus with extreme surface features.', 1200, -200, true, false);
INSERT INTO public.moon VALUES (15, 8, 'Triton', 1353, 33000000, true, 'The largest moon of Neptune.', 18000, -235, true, true);
INSERT INTO public.moon VALUES (16, 8, 'Proteus', 418, 1700000, true, 'A moon of Neptune.', 1500, -240, true, false);
INSERT INTO public.moon VALUES (17, 8, 'Nereid', 170, 1000000, true, 'A moon of Neptune with an eccentric orbit.', 1200, -250, false, false);
INSERT INTO public.moon VALUES (18, 8, 'Despina', 73, 260000, true, 'A small moon of Neptune.', 1000, -245, false, true);
INSERT INTO public.moon VALUES (19, 9, 'Andromeda Moon 1', 1800, 1700000, true, 'A moon orbiting a planet in the Andromeda Galaxy.', 18000, -15, true, false);
INSERT INTO public.moon VALUES (20, 9, 'Andromeda Moon 2', 1600, 1500000, false, 'Another moon in the Andromeda Galaxy.', 16000, -20, false, true);
INSERT INTO public.moon VALUES (21, 10, 'Pinwheel Moon 1', 1600, 1400000, false, 'A moon in the Pinwheel Galaxy.', 14000, -30, true, false);
INSERT INTO public.moon VALUES (22, 10, 'Pinwheel Moon 2', 1400, 1300000, true, 'Another moon in the Pinwheel Galaxy.', 12000, -25, false, true);
INSERT INTO public.moon VALUES (23, 11, 'Sombrero Moon 1', 1400, 1300000, true, 'A moon in the Sombrero Galaxy.', 16000, -10, true, false);
INSERT INTO public.moon VALUES (24, 11, 'Sombrero Moon 2', 1300, 1200000, false, 'Another moon in the Sombrero Galaxy.', 15000, -15, false, true);
INSERT INTO public.moon VALUES (25, 12, 'Moon of Moon', 1200, 1100000, true, 'A moon of a moon in the galaxy system.', 11000, -20, true, false);
INSERT INTO public.moon VALUES (26, 12, 'Moon of Pinwheel', 1300, 1200000, false, 'A moon orbiting a moon of the Pinwheel Galaxy.', 13000, -15, true, true);
INSERT INTO public.moon VALUES (27, 13, 'Moon of Sombrero', 1100, 1000000, false, 'A moon of a moon in the Sombrero Galaxy.', 10000, -25, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 12742, 365.25, true, 'The third planet from the Sun, known for its life-sustaining conditions.', 1, 15, false, false);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 6779, 687, false, 'The fourth planet from the Sun, known for its red color.', 2, -60, false, false);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 12104, 224.7, false, 'The second planet from the Sun, known for its thick atmosphere.', 0, 462, true, false);
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', 139820, 4333, false, 'The largest planet in our Solar System.', 79, -110, true, true);
INSERT INTO public.planet VALUES (5, 1, 'Saturn', 116460, 1340, false, 'Known for its prominent ring system.', 82, -140, true, false);
INSERT INTO public.planet VALUES (6, 1, 'Uranus', 50724, 1050, false, 'A gas giant with a unique tilt.', 27, -195, true, true);
INSERT INTO public.planet VALUES (7, 1, 'Neptune', 49244, 1010, false, 'The farthest planet from the Sun, known for its blue color.', 14, -200, true, true);
INSERT INTO public.planet VALUES (8, 2, 'Andromeda Planet 1', 7000, 365, true, 'A habitable planet in the Andromeda Galaxy.', 4, 25, false, true);
INSERT INTO public.planet VALUES (9, 2, 'Andromeda Planet 2', 9000, 400, false, 'A planet in the Andromeda Galaxy with harsh conditions.', 3, 30, true, false);
INSERT INTO public.planet VALUES (10, 2, 'Andromeda Planet 3', 8000, 350, true, 'A potentially habitable planet in the Andromeda Galaxy.', 2, 20, false, true);
INSERT INTO public.planet VALUES (11, 2, 'Andromeda Planet 4', 8500, 380, false, 'A harsh planet in the Andromeda Galaxy.', 1, 15, true, false);
INSERT INTO public.planet VALUES (12, 3, 'Triangulum Planet 1', 14000, 400, true, 'A large planet in the Triangulum Galaxy.', 3, 20, true, false);
INSERT INTO public.planet VALUES (13, 3, 'Triangulum Planet 2', 9000, 300, false, 'A smaller planet in the Triangulum Galaxy.', 1, -10, false, true);
INSERT INTO public.planet VALUES (14, 3, 'Triangulum Planet 3', 11000, 350, true, 'A habitable planet in the Triangulum Galaxy.', 4, 25, true, false);
INSERT INTO public.planet VALUES (15, 3, 'Triangulum Planet 4', 9500, 320, false, 'Another planet in the Triangulum Galaxy.', 2, 10, false, true);
INSERT INTO public.planet VALUES (16, 4, 'Whirlpool Planet 1', 7500, 370, true, 'A habitable planet in the Whirlpool Galaxy.', 5, 30, true, false);
INSERT INTO public.planet VALUES (17, 4, 'Whirlpool Planet 2', 8000, 360, false, 'A planet with harsh conditions in the Whirlpool Galaxy.', 3, 25, false, true);
INSERT INTO public.planet VALUES (18, 4, 'Whirlpool Planet 3', 9000, 340, true, 'A potentially habitable planet in the Whirlpool Galaxy.', 4, 20, true, false);
INSERT INTO public.planet VALUES (19, 4, 'Whirlpool Planet 4', 6500, 310, false, 'A planet with extreme temperatures in the Whirlpool Galaxy.', 2, -15, false, true);
INSERT INTO public.planet VALUES (20, 5, 'Pinwheel Planet 1', 5000, 450, false, 'A planet in the Pinwheel Galaxy with harsh conditions.', 2, -40, false, true);
INSERT INTO public.planet VALUES (21, 5, 'Pinwheel Planet 2', 6000, 430, true, 'A potentially habitable planet in the Pinwheel Galaxy.', 5, 35, true, false);
INSERT INTO public.planet VALUES (22, 5, 'Pinwheel Planet 3', 5500, 420, false, 'Another planet in the Pinwheel Galaxy.', 3, 25, true, true);
INSERT INTO public.planet VALUES (23, 5, 'Pinwheel Planet 4', 7000, 440, true, 'A large habitable planet in the Pinwheel Galaxy.', 4, 20, false, false);
INSERT INTO public.planet VALUES (24, 6, 'Sombrero Planet 1', 6000, 380, true, 'A planet in the Sombrero Galaxy with potential for life.', 5, 30, true, false);
INSERT INTO public.planet VALUES (25, 6, 'Sombrero Planet 2', 8000, 340, false, 'A planet with extreme conditions in the Sombrero Galaxy.', 3, -30, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1989000000000000000000000000000, 5778, true, 'The star at the center of our Solar System.', 8, 1000000, false, false);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 4180000000000000000000000000000, 9940, false, 'The brightest star in Earth’s night sky.', 4, 2000000, true, true);
INSERT INTO public.star VALUES (3, 2, 'Andromeda Star 1', 2340000000000000000000000000000, 6400, true, 'One of the major stars in the Andromeda Galaxy.', 10, 1500000, false, false);
INSERT INTO public.star VALUES (4, 2, 'Andromeda Star 2', 1560000000000000000000000000000, 5800, false, 'A prominent star in Andromeda Galaxy.', 6, 1200000, true, false);
INSERT INTO public.star VALUES (5, 3, 'Triangulum Star 1', 1200000000000000000000000000000, 5600, true, 'Star in the Triangulum Galaxy.', 5, 800000, false, true);
INSERT INTO public.star VALUES (6, 3, 'Triangulum Star 2', 2750000000000000000000000000000, 6200, false, 'Another star in the Triangulum Galaxy.', 7, 950000, true, false);
INSERT INTO public.star VALUES (7, 4, 'Whirlpool Star 1', 1800000000000000000000000000000, 6000, true, 'Star in the Whirlpool Galaxy.', 9, 1400000, false, true);
INSERT INTO public.star VALUES (8, 4, 'Whirlpool Star 2', 2100000000000000000000000000000, 6500, false, 'Another star in the Whirlpool Galaxy.', 8, 1300000, true, false);
INSERT INTO public.star VALUES (9, 5, 'Pinwheel Star 1', 1500000000000000000000000000000, 6200, true, 'Star in the Pinwheel Galaxy.', 6, 1200000, false, true);
INSERT INTO public.star VALUES (10, 5, 'Pinwheel Star 2', 2000000000000000000000000000000, 6400, false, 'Another star in the Pinwheel Galaxy.', 7, 1100000, true, false);
INSERT INTO public.star VALUES (11, 6, 'Sombrero Star 1', 2200000000000000000000000000000, 6300, true, 'Star in the Sombrero Galaxy.', 5, 1150000, false, true);
INSERT INTO public.star VALUES (12, 6, 'Sombrero Star 2', 2500000000000000000000000000000, 6500, false, 'Another star in the Sombrero Galaxy.', 4, 1050000, true, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 25, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

