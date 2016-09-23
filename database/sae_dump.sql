--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: empresa1; Type: SCHEMA; Schema: -; Owner: sae
--

CREATE SCHEMA empresa1;


ALTER SCHEMA empresa1 OWNER TO sae;

--
-- Name: global; Type: SCHEMA; Schema: -; Owner: sae
--

CREATE SCHEMA global;


ALTER SCHEMA global OWNER TO sae;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = empresa1, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ae_acciones; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_acciones (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    fecha_baja timestamp without time zone,
    host character varying(100),
    nombre character varying(50) NOT NULL,
    servicio character varying(250) NOT NULL
);


ALTER TABLE ae_acciones OWNER TO sae;

--
-- Name: ae_acciones_por_dato; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_acciones_por_dato (
    id integer NOT NULL,
    fecha_desasociacion timestamp without time zone,
    nombre_parametro character varying(50) NOT NULL,
    aear_id integer NOT NULL,
    aeds_id integer NOT NULL
);


ALTER TABLE ae_acciones_por_dato OWNER TO sae;

--
-- Name: ae_acciones_por_recurso; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_acciones_por_recurso (
    id integer NOT NULL,
    evento character varying(1) NOT NULL,
    fecha_baja timestamp without time zone,
    orden_ejecucion integer,
    aeac_id integer NOT NULL,
    aere_id integer NOT NULL
);


ALTER TABLE ae_acciones_por_recurso OWNER TO sae;

--
-- Name: ae_agendas; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_agendas (
    id integer NOT NULL,
    descripcion character varying(1000) NOT NULL,
    fecha_baja timestamp without time zone,
    nombre character varying(100) NOT NULL,
    tramite_id character varying(25),
    timezone character varying(25),
    idiomas character varying(100),
    con_cda boolean DEFAULT false,
    tramite_codigo character varying(10),
    publicar_novedades boolean DEFAULT false NOT NULL,
    con_trazabilidad boolean DEFAULT false NOT NULL
);


ALTER TABLE ae_agendas OWNER TO sae;

--
-- Name: ae_agrupaciones_datos; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_agrupaciones_datos (
    id integer NOT NULL,
    fecha_baja timestamp without time zone,
    nombre character varying(50) NOT NULL,
    orden integer NOT NULL,
    aere_id integer NOT NULL,
    borrar_flag boolean NOT NULL
);


ALTER TABLE ae_agrupaciones_datos OWNER TO sae;

--
-- Name: ae_anios; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_anios (
    id integer NOT NULL,
    anio integer NOT NULL,
    aepl_id integer NOT NULL
);


ALTER TABLE ae_anios OWNER TO sae;

--
-- Name: ae_atencion; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_atencion (
    id integer NOT NULL,
    asistio boolean NOT NULL,
    duracion integer NOT NULL,
    fact timestamp without time zone NOT NULL,
    fcrea timestamp without time zone NOT NULL,
    funcionario character varying(255) NOT NULL,
    aers_id integer NOT NULL
);


ALTER TABLE ae_atencion OWNER TO sae;

--
-- Name: ae_comunicaciones; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_comunicaciones (
    id integer NOT NULL,
    tipo_1 character varying(25) NOT NULL,
    tipo_2 character varying(25) NOT NULL,
    destino character varying(100) NOT NULL,
    recurso_id integer NOT NULL,
    reserva_id integer NOT NULL,
    procesado boolean DEFAULT false NOT NULL
);


ALTER TABLE ae_comunicaciones OWNER TO sae;

--
-- Name: ae_constante_validacion; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_constante_validacion (
    id integer NOT NULL,
    fecha_baja timestamp without time zone,
    largo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(30) NOT NULL,
    aeva_id integer NOT NULL
);


ALTER TABLE ae_constante_validacion OWNER TO sae;

--
-- Name: ae_datos_a_solicitar; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_datos_a_solicitar (
    id integer NOT NULL,
    ancho_despliegue integer NOT NULL,
    columna integer NOT NULL,
    es_clave boolean NOT NULL,
    etiqueta character varying(50) NOT NULL,
    fecha_baja timestamp without time zone,
    fila integer NOT NULL,
    incluir_en_llamador boolean NOT NULL,
    incluir_en_reporte boolean NOT NULL,
    largo integer,
    largo_en_llamador integer NOT NULL,
    nombre character varying(50) NOT NULL,
    orden_en_llamador integer NOT NULL,
    requerido boolean NOT NULL,
    texto_ayuda character varying(100),
    tipo character varying(30) NOT NULL,
    aead_id integer NOT NULL,
    aere_id integer NOT NULL,
    borrar_flag boolean DEFAULT true NOT NULL
);


ALTER TABLE ae_datos_a_solicitar OWNER TO sae;

--
-- Name: ae_datos_del_recurso; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_datos_del_recurso (
    id integer NOT NULL,
    etiqueta character varying(50) NOT NULL,
    orden integer NOT NULL,
    valor character varying(100) NOT NULL,
    aere_id integer NOT NULL
);


ALTER TABLE ae_datos_del_recurso OWNER TO sae;

--
-- Name: ae_datos_reserva; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_datos_reserva (
    id integer NOT NULL,
    valor character varying(100) NOT NULL,
    aeds_id integer NOT NULL,
    aers_id integer NOT NULL
);


ALTER TABLE ae_datos_reserva OWNER TO sae;

--
-- Name: ae_dias_del_mes; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_dias_del_mes (
    id integer NOT NULL,
    dia_del_mes integer NOT NULL,
    aepl_id integer NOT NULL
);


ALTER TABLE ae_dias_del_mes OWNER TO sae;

--
-- Name: ae_dias_semana; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_dias_semana (
    id integer NOT NULL,
    dia_semana integer NOT NULL,
    aepl_id integer NOT NULL
);


ALTER TABLE ae_dias_semana OWNER TO sae;

--
-- Name: ae_disponibilidades; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_disponibilidades (
    id integer NOT NULL,
    cupo integer NOT NULL,
    fecha date NOT NULL,
    fecha_baja timestamp without time zone,
    hora_fin timestamp without time zone NOT NULL,
    hora_inicio timestamp without time zone NOT NULL,
    numerador integer NOT NULL,
    version integer NOT NULL,
    aepl_id integer,
    aere_id integer NOT NULL
);


ALTER TABLE ae_disponibilidades OWNER TO sae;

--
-- Name: ae_frases_captcha; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_frases_captcha (
    clave character varying(100) NOT NULL,
    frase character varying(1024),
    idioma character varying(5) NOT NULL
);


ALTER TABLE ae_frases_captcha OWNER TO sae;

--
-- Name: ae_llamadas; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_llamadas (
    id integer NOT NULL,
    etiqueta character varying(100) NOT NULL,
    fecha date NOT NULL,
    hora timestamp without time zone NOT NULL,
    numero integer NOT NULL,
    puesto integer NOT NULL,
    aere_id integer NOT NULL,
    aers_id integer NOT NULL
);


ALTER TABLE ae_llamadas OWNER TO sae;

--
-- Name: ae_meses; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_meses (
    id integer NOT NULL,
    mes integer NOT NULL,
    aepl_id integer NOT NULL
);


ALTER TABLE ae_meses OWNER TO sae;

--
-- Name: ae_parametros_accion; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_parametros_accion (
    id integer NOT NULL,
    fecha_baja timestamp without time zone,
    largo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(30) NOT NULL,
    aeac_id integer NOT NULL
);


ALTER TABLE ae_parametros_accion OWNER TO sae;

--
-- Name: ae_parametros_autocompletar; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_parametros_autocompletar (
    id integer NOT NULL,
    fecha_baja timestamp without time zone,
    modo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(30) NOT NULL,
    aeserv_id integer NOT NULL
);


ALTER TABLE ae_parametros_autocompletar OWNER TO sae;

--
-- Name: ae_parametros_validacion; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_parametros_validacion (
    id integer NOT NULL,
    fecha_baja timestamp without time zone,
    largo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(30) NOT NULL,
    aeva_id integer NOT NULL
);


ALTER TABLE ae_parametros_validacion OWNER TO sae;

--
-- Name: ae_plantillas; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_plantillas (
    id integer NOT NULL,
    cupo integer NOT NULL,
    fecha_baja timestamp without time zone,
    frecuencia integer NOT NULL,
    generacion_automatica boolean NOT NULL,
    hora_fin timestamp without time zone NOT NULL,
    hora_inicio timestamp without time zone NOT NULL,
    aere_id integer NOT NULL
);


ALTER TABLE ae_plantillas OWNER TO sae;

--
-- Name: ae_preguntas_captcha; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_preguntas_captcha (
    clave character varying(100) NOT NULL,
    pregunta character varying(1024),
    respuesta character varying(25),
    idioma character varying(5) NOT NULL
);


ALTER TABLE ae_preguntas_captcha OWNER TO sae;

--
-- Name: ae_recursos; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_recursos (
    id integer NOT NULL,
    cant_dias_a_generar integer NOT NULL,
    descripcion character varying(1000) NOT NULL,
    dias_inicio_ventana_internet integer NOT NULL,
    dias_inicio_ventana_intranet integer NOT NULL,
    dias_ventana_internet integer NOT NULL,
    dias_ventana_intranet integer NOT NULL,
    fecha_baja timestamp without time zone,
    fecha_fin timestamp without time zone,
    fecha_fin_disp timestamp without time zone,
    fecha_inicio timestamp without time zone NOT NULL,
    fecha_inicio_disp timestamp without time zone NOT NULL,
    largo_lista_espera integer,
    mostrar_numero_en_llamador boolean NOT NULL,
    mostrar_numero_en_ticket boolean NOT NULL,
    nombre character varying(100) NOT NULL,
    reserva_multiple boolean NOT NULL,
    sabado_es_habil boolean NOT NULL,
    serie character varying(3),
    usar_llamador boolean NOT NULL,
    ventana_cupos_minimos integer NOT NULL,
    version integer NOT NULL,
    visible_internet boolean NOT NULL,
    aeag_id integer NOT NULL,
    oficina_id character varying(25),
    direccion character varying(100),
    localidad character varying(100),
    departamento character varying(100),
    telefonos character varying(100),
    horarios character varying(100),
    latitud numeric,
    longitud numeric,
    mostrar_id_en_ticket boolean
);


ALTER TABLE ae_recursos OWNER TO sae;

--
-- Name: ae_reservas; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_reservas (
    id integer NOT NULL,
    estado character varying(1) NOT NULL,
    fact timestamp without time zone NOT NULL,
    fcrea timestamp without time zone NOT NULL,
    numero integer,
    observaciones character varying(100),
    origen character varying(1),
    ucancela character varying(255),
    ucrea character varying(255),
    version integer NOT NULL,
    codigo_seguridad character varying(10) DEFAULT '00000'::character varying,
    trazabilidad_guid character varying(25)
);


ALTER TABLE ae_reservas OWNER TO sae;

--
-- Name: ae_reservas_disponibilidades; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_reservas_disponibilidades (
    aers_id integer NOT NULL,
    aedi_id integer NOT NULL
);


ALTER TABLE ae_reservas_disponibilidades OWNER TO sae;

--
-- Name: ae_serv_autocomp_por_dato; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_serv_autocomp_por_dato (
    id integer NOT NULL,
    fecha_desasociacion timestamp without time zone,
    nombre_parametro character varying(50) NOT NULL,
    aeds_id integer NOT NULL,
    aesr_id integer NOT NULL
);


ALTER TABLE ae_serv_autocomp_por_dato OWNER TO sae;

--
-- Name: ae_serv_autocompletar; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_serv_autocompletar (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    fecha_baja timestamp without time zone,
    host character varying(100),
    nombre character varying(50) NOT NULL,
    servicio character varying(250) NOT NULL
);


ALTER TABLE ae_serv_autocompletar OWNER TO sae;

--
-- Name: ae_servicio_por_recurso; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_servicio_por_recurso (
    id integer NOT NULL,
    fecha_baja timestamp without time zone,
    aeserv_id integer NOT NULL,
    aere_id integer NOT NULL
);


ALTER TABLE ae_servicio_por_recurso OWNER TO sae;

--
-- Name: ae_textos; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_textos (
    codigo character varying(100) NOT NULL,
    idioma character varying(5) NOT NULL,
    texto character varying(4096) NOT NULL
);


ALTER TABLE ae_textos OWNER TO sae;

--
-- Name: ae_textos_agenda; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_textos_agenda (
    id integer NOT NULL,
    texto_paso1 character varying(1000),
    texto_paso2 character varying(1000),
    texto_paso3 character varying(1000),
    texto_sel_recurso character varying(50),
    texto_ticket character varying(1000),
    aeag_id integer NOT NULL,
    texto_correo_conf character varying(1000),
    texto_correo_canc character varying(1000),
    por_defecto boolean DEFAULT false NOT NULL,
    idioma character varying(5) NOT NULL
);


ALTER TABLE ae_textos_agenda OWNER TO sae;

--
-- Name: ae_textos_recurso; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_textos_recurso (
    id integer NOT NULL,
    texto_paso2 character varying(1000),
    texto_paso3 character varying(1000),
    ticket_etiqueta_dos character varying(15),
    ticket_etiqueta_uno character varying(15),
    titulo_ciudadano_en_llamador character varying(255),
    titulo_puesto_en_llamador character varying(255),
    valor_etiqueta_dos character varying(30),
    valor_etiqueta_uno character varying(30),
    aere_id integer NOT NULL,
    idioma character varying(5) NOT NULL
);


ALTER TABLE ae_textos_recurso OWNER TO sae;

--
-- Name: ae_validaciones; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_validaciones (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    fecha_baja timestamp without time zone,
    host character varying(100),
    nombre character varying(50) NOT NULL,
    servicio character varying(250) NOT NULL
);


ALTER TABLE ae_validaciones OWNER TO sae;

--
-- Name: ae_validaciones_por_dato; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_validaciones_por_dato (
    id integer NOT NULL,
    fecha_desasociacion timestamp without time zone,
    nombre_parametro character varying(50) NOT NULL,
    aeds_id integer NOT NULL,
    aevr_id integer NOT NULL
);


ALTER TABLE ae_validaciones_por_dato OWNER TO sae;

--
-- Name: ae_validaciones_por_recurso; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_validaciones_por_recurso (
    id integer NOT NULL,
    fecha_baja timestamp without time zone,
    orden_ejecucion integer,
    aere_id integer NOT NULL,
    aeva_id integer NOT NULL
);


ALTER TABLE ae_validaciones_por_recurso OWNER TO sae;

--
-- Name: ae_valor_constante_val_rec; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_valor_constante_val_rec (
    id integer NOT NULL,
    fecha_desasociacion timestamp without time zone,
    nombre_constante character varying(50) NOT NULL,
    valor character varying(100) NOT NULL,
    aevr_id integer NOT NULL
);


ALTER TABLE ae_valor_constante_val_rec OWNER TO sae;

--
-- Name: ae_valores_del_dato; Type: TABLE; Schema: empresa1; Owner: sae
--

CREATE TABLE ae_valores_del_dato (
    id integer NOT NULL,
    etiqueta character varying(50) NOT NULL,
    fecha_desde timestamp without time zone NOT NULL,
    fecha_hasta timestamp without time zone,
    orden integer NOT NULL,
    valor character varying(50) NOT NULL,
    aeds_id integer NOT NULL,
    borrar_flag boolean DEFAULT true NOT NULL
);


ALTER TABLE ae_valores_del_dato OWNER TO sae;

--
-- Name: s_ae_accion; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_accion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_accion OWNER TO sae;

--
-- Name: s_ae_acciondato; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_acciondato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_acciondato OWNER TO sae;

--
-- Name: s_ae_accionrecurso; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_accionrecurso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_accionrecurso OWNER TO sae;

--
-- Name: s_ae_agenda; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_agenda
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_agenda OWNER TO sae;

--
-- Name: s_ae_agrupacion_dato; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_agrupacion_dato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_agrupacion_dato OWNER TO sae;

--
-- Name: s_ae_anio; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_anio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_anio OWNER TO sae;

--
-- Name: s_ae_atencion; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_atencion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_atencion OWNER TO sae;

--
-- Name: s_ae_comunicaciones; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_comunicaciones
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_comunicaciones OWNER TO sae;

--
-- Name: s_ae_constval; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_constval
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_constval OWNER TO sae;

--
-- Name: s_ae_datoasolicitar; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_datoasolicitar
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_datoasolicitar OWNER TO sae;

--
-- Name: s_ae_datodelrecurso; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_datodelrecurso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_datodelrecurso OWNER TO sae;

--
-- Name: s_ae_datoreserva; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_datoreserva
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_datoreserva OWNER TO sae;

--
-- Name: s_ae_dia_mes; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_dia_mes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_dia_mes OWNER TO sae;

--
-- Name: s_ae_dia_semana; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_dia_semana
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_dia_semana OWNER TO sae;

--
-- Name: s_ae_disponibilidad; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_disponibilidad
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_disponibilidad OWNER TO sae;

--
-- Name: s_ae_llamada; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_llamada
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_llamada OWNER TO sae;

--
-- Name: s_ae_mes; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_mes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_mes OWNER TO sae;

--
-- Name: s_ae_paramaccion; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_paramaccion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_paramaccion OWNER TO sae;

--
-- Name: s_ae_parametros_autocompletar; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_parametros_autocompletar
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_parametros_autocompletar OWNER TO sae;

--
-- Name: s_ae_paramval; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_paramval
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_paramval OWNER TO sae;

--
-- Name: s_ae_plantilla; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_plantilla
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_plantilla OWNER TO sae;

--
-- Name: s_ae_recurso; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_recurso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_recurso OWNER TO sae;

--
-- Name: s_ae_reserva; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_reserva
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_reserva OWNER TO sae;

--
-- Name: s_ae_serv_autocompletar; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_serv_autocompletar
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_serv_autocompletar OWNER TO sae;

--
-- Name: s_ae_servdato; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_servdato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_servdato OWNER TO sae;

--
-- Name: s_ae_servrecurso; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_servrecurso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_servrecurso OWNER TO sae;

--
-- Name: s_ae_texto_agenda; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_texto_agenda
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_texto_agenda OWNER TO sae;

--
-- Name: s_ae_textorecurso; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_textorecurso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_textorecurso OWNER TO sae;

--
-- Name: s_ae_valconstante; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_valconstante
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_valconstante OWNER TO sae;

--
-- Name: s_ae_valdato; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_valdato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_valdato OWNER TO sae;

--
-- Name: s_ae_validacion; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_validacion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_validacion OWNER TO sae;

--
-- Name: s_ae_valorposible; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_valorposible
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_valorposible OWNER TO sae;

--
-- Name: s_ae_valrecurso; Type: SEQUENCE; Schema: empresa1; Owner: sae
--

CREATE SEQUENCE s_ae_valrecurso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_valrecurso OWNER TO sae;

SET search_path = global, pg_catalog;

--
-- Name: ae_captchas; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_captchas (
    clave character varying(100) NOT NULL,
    fase character varying(1024)
);


ALTER TABLE ae_captchas OWNER TO sae;

--
-- Name: ae_configuracion; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_configuracion (
    clave character varying(100) NOT NULL,
    valor character varying(1024)
);


ALTER TABLE ae_configuracion OWNER TO sae;

--
-- Name: ae_empresas; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_empresas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    datasource character varying(25) NOT NULL,
    fecha_baja timestamp without time zone,
    org_id integer,
    org_codigo character varying(10),
    org_nombre character varying(100),
    unej_id integer,
    unej_codigo character varying(10),
    unej_nombre character varying(100),
    logo bytea,
    cc_finalidad character varying(100) DEFAULT ''::character varying NOT NULL,
    cc_responsable character varying(100) DEFAULT ''::character varying NOT NULL,
    cc_direccion character varying(100) DEFAULT ''::character varying NOT NULL,
    logo_texto character varying(100),
    timezone character varying(25),
    formato_fecha character varying(25),
    formato_hora character varying(25),
    oid character varying(50),
    pie_publico text
);


ALTER TABLE ae_empresas OWNER TO sae;

--
-- Name: ae_novedades; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_novedades (
    fecha_creacion timestamp with time zone NOT NULL,
    fecha_ult_intento timestamp without time zone NOT NULL,
    intentos integer DEFAULT 0 NOT NULL,
    datos character varying(4096) NOT NULL,
    enviado boolean DEFAULT false NOT NULL,
    id integer NOT NULL,
    reserva_id integer,
    empresa_id integer
);


ALTER TABLE ae_novedades OWNER TO sae;

--
-- Name: ae_oficinas; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_oficinas (
    id character varying(25) NOT NULL,
    tramite_id character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(100),
    localidad character varying(100),
    departamento character varying(100),
    telefonos character varying(100),
    horarios character varying(100),
    comentarios character varying(1000)
);


ALTER TABLE ae_oficinas OWNER TO sae;

--
-- Name: ae_organismos; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_organismos (
    id integer NOT NULL,
    codigo character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE ae_organismos OWNER TO sae;

--
-- Name: ae_rel_usuarios_empresas; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_rel_usuarios_empresas (
    usuario_id integer NOT NULL,
    empresa_id integer NOT NULL
);


ALTER TABLE ae_rel_usuarios_empresas OWNER TO sae;

--
-- Name: ae_rel_usuarios_roles; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_rel_usuarios_roles (
    usuario_id integer NOT NULL,
    empresa_id integer NOT NULL,
    rol_nombre character varying NOT NULL
);


ALTER TABLE ae_rel_usuarios_roles OWNER TO sae;

--
-- Name: ae_textos; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_textos (
    codigo character varying(100) NOT NULL,
    texto character varying(4096) NOT NULL
);


ALTER TABLE ae_textos OWNER TO sae;

--
-- Name: ae_tokens; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_tokens (
    token character varying(25) NOT NULL,
    empresa_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    fecha timestamp without time zone NOT NULL
);


ALTER TABLE ae_tokens OWNER TO sae;

--
-- Name: ae_tramites; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_tramites (
    id character varying(25) NOT NULL,
    empresa_id integer,
    nombre character varying(100) NOT NULL,
    quees character varying(1000) NOT NULL,
    temas character varying(1000) NOT NULL,
    online boolean NOT NULL
);


ALTER TABLE ae_tramites OWNER TO sae;

--
-- Name: ae_trazabilidad; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_trazabilidad (
    transaccion_id character varying(100) NOT NULL,
    fecha_creacion timestamp with time zone NOT NULL,
    fecha_ult_intento timestamp without time zone NOT NULL,
    intentos integer DEFAULT 0 NOT NULL,
    datos character varying(4096) NOT NULL,
    enviado boolean DEFAULT false NOT NULL,
    id integer NOT NULL,
    es_cabezal boolean DEFAULT false NOT NULL,
    reserva_id integer,
    empresa_id integer,
    es_final boolean DEFAULT false
);


ALTER TABLE ae_trazabilidad OWNER TO sae;

--
-- Name: ae_unidadesejecutoras; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_unidadesejecutoras (
    id integer NOT NULL,
    codigo character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE ae_unidadesejecutoras OWNER TO sae;

--
-- Name: ae_usuarios; Type: TABLE; Schema: global; Owner: sae
--

CREATE TABLE ae_usuarios (
    id integer NOT NULL,
    codigo character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_baja timestamp without time zone,
    password character varying(50),
    correoe character varying(100),
    superadmin boolean
);


ALTER TABLE ae_usuarios OWNER TO sae;

--
-- Name: s_ae_empresa; Type: SEQUENCE; Schema: global; Owner: sae
--

CREATE SEQUENCE s_ae_empresa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_empresa OWNER TO sae;

--
-- Name: s_ae_novedades; Type: SEQUENCE; Schema: global; Owner: sae
--

CREATE SEQUENCE s_ae_novedades
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_novedades OWNER TO sae;

--
-- Name: s_ae_trazabilidad; Type: SEQUENCE; Schema: global; Owner: sae
--

CREATE SEQUENCE s_ae_trazabilidad
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_trazabilidad OWNER TO sae;

--
-- Name: s_ae_usuario; Type: SEQUENCE; Schema: global; Owner: sae
--

CREATE SEQUENCE s_ae_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_ae_usuario OWNER TO sae;

SET search_path = empresa1, pg_catalog;

--
-- Data for Name: ae_acciones; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_acciones (id, descripcion, fecha_baja, host, nombre, servicio) FROM stdin;
\.


--
-- Data for Name: ae_acciones_por_dato; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_acciones_por_dato (id, fecha_desasociacion, nombre_parametro, aear_id, aeds_id) FROM stdin;
\.


--
-- Data for Name: ae_acciones_por_recurso; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_acciones_por_recurso (id, evento, fecha_baja, orden_ejecucion, aeac_id, aere_id) FROM stdin;
\.


--
-- Data for Name: ae_agendas; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_agendas (id, descripcion, fecha_baja, nombre, tramite_id, timezone, idiomas, con_cda, tramite_codigo, publicar_novedades, con_trazabilidad) FROM stdin;
2	lolo	\N	lolo	0			f	1	f	f
\.


--
-- Data for Name: ae_agrupaciones_datos; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_agrupaciones_datos (id, fecha_baja, nombre, orden, aere_id, borrar_flag) FROM stdin;
\.


--
-- Data for Name: ae_anios; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_anios (id, anio, aepl_id) FROM stdin;
\.


--
-- Data for Name: ae_atencion; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_atencion (id, asistio, duracion, fact, fcrea, funcionario, aers_id) FROM stdin;
\.


--
-- Data for Name: ae_comunicaciones; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_comunicaciones (id, tipo_1, tipo_2, destino, recurso_id, reserva_id, procesado) FROM stdin;
\.


--
-- Data for Name: ae_constante_validacion; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_constante_validacion (id, fecha_baja, largo, nombre, tipo, aeva_id) FROM stdin;
\.


--
-- Data for Name: ae_datos_a_solicitar; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_datos_a_solicitar (id, ancho_despliegue, columna, es_clave, etiqueta, fecha_baja, fila, incluir_en_llamador, incluir_en_reporte, largo, largo_en_llamador, nombre, orden_en_llamador, requerido, texto_ayuda, tipo, aead_id, aere_id, borrar_flag) FROM stdin;
\.


--
-- Data for Name: ae_datos_del_recurso; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_datos_del_recurso (id, etiqueta, orden, valor, aere_id) FROM stdin;
\.


--
-- Data for Name: ae_datos_reserva; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_datos_reserva (id, valor, aeds_id, aers_id) FROM stdin;
\.


--
-- Data for Name: ae_dias_del_mes; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_dias_del_mes (id, dia_del_mes, aepl_id) FROM stdin;
\.


--
-- Data for Name: ae_dias_semana; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_dias_semana (id, dia_semana, aepl_id) FROM stdin;
\.


--
-- Data for Name: ae_disponibilidades; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_disponibilidades (id, cupo, fecha, fecha_baja, hora_fin, hora_inicio, numerador, version, aepl_id, aere_id) FROM stdin;
\.


--
-- Data for Name: ae_frases_captcha; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_frases_captcha (clave, frase, idioma) FROM stdin;
\.


--
-- Data for Name: ae_llamadas; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_llamadas (id, etiqueta, fecha, hora, numero, puesto, aere_id, aers_id) FROM stdin;
\.


--
-- Data for Name: ae_meses; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_meses (id, mes, aepl_id) FROM stdin;
\.


--
-- Data for Name: ae_parametros_accion; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_parametros_accion (id, fecha_baja, largo, nombre, tipo, aeac_id) FROM stdin;
\.


--
-- Data for Name: ae_parametros_autocompletar; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_parametros_autocompletar (id, fecha_baja, modo, nombre, tipo, aeserv_id) FROM stdin;
\.


--
-- Data for Name: ae_parametros_validacion; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_parametros_validacion (id, fecha_baja, largo, nombre, tipo, aeva_id) FROM stdin;
\.


--
-- Data for Name: ae_plantillas; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_plantillas (id, cupo, fecha_baja, frecuencia, generacion_automatica, hora_fin, hora_inicio, aere_id) FROM stdin;
\.


--
-- Data for Name: ae_preguntas_captcha; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_preguntas_captcha (clave, pregunta, respuesta, idioma) FROM stdin;
P000001	¿De qué color era el caballo blanco de Artigas?	blanco	es
P000002	¿Cuánto es dos más dos? Responde con palabras	cuatro	es
P000003	Escribe la tercera palabra de: Hoy está lloviendo	lloviendo	es
P000004	¿Cuánto es tres más uno? Responde con palabras	cuatro	es
P000005	Escribe la segunda palabra de: Hoy es Lunes	es	es
P000006	¿Cuánto es uno más uno? Responde con palabras	dos	es
P000007	¿Cuánto es cinco más dos? Responde con palabras	siete	es
P000008	Escribe la primera palabra de: Hoy está soleado	hoy	es
P000009	De los números uno, cuatro y dos, ¿cuál es el menor?	uno	es
P000010	¿Cuántos colores hay en la lista: torta, verde, hotel?	uno	es
P000011	¿Cuál es el segundo dígito de 7101712? Responde con palabras	uno	es
P000012	Si el león es amarillo, ¿de qué color es el león?	amarillo	es
P000013	¿Cuál de los siguientes es un color: libro, nariz, verde, queso?	verde	es
P000014	Si mañana es sábado, ¿qué día es hoy?	viernes	es
P000016	Escribe la segunda palabra de: Ayer tuve frío	tuve	es
P000017	Escribe la última palabra de: me caigo y no me levanto	levanto	es
P000018	Escribe la quinta palabra de: más vale pájaro en mano que cien volando	mano	es
P000020	Escribe la quinta palabra de: cuanto menos se piensa salta la liebre	salta	es
P000021	Un día en la vida, ¿cuántos días son? escribe en letras	uno	es
P000022	Tres tristes tigres comen trigo, ¿qué comen los tigres?	trigo	es
P000023	Si hoy me acuesto, despierto mañana; ¿cuándo me acuesto?	hoy	es
P000024	¿Qué animal es mayor, el mono  o el elefante?	elefante	es
P000025	¿Cuál es el primer mes del año?	enero	es
P000026	¿Cuál es el segundo mes del año?	febrero	es
P000027	¿Cuál es el tercer mes del año?	marzo	es
P000028	¿Cuál es el cuarto mes del año?	abril	es
P000029	¿Cuál es el quinto mes del año?	mayo	es
P000030	¿Cuál es el sexto mes del año?	junio	es
P000031	¿Cuál es el séptimo mes del año?	julio	es
P000032	¿Cuál es el octavo mes del año?	agosto	es
P000033	¿Cuál es el noveno mes del año?	setiembre	es
P000034	¿Cuál es el décimo mes del año?	octubre	es
P000035	¿Cuál es el penúltimo mes del año?	noviembre	es
P000036	¿Cuál es el último mes del año?	diciembre	es
P000037	¿Cuántos días tiene enero? Responde con números	31	es
P000038	¿Cuántos días tiene febrero? Responde con números	28	es
P000039	¿Cuántos días tiene marzo? Responde con números	31	es
P000040	¿Cuántos días tiene abril? Responde con números	30	es
P000041	¿Cuántos días tiene mayo? Responde con números	31	es
P000042	¿Cuántos días tiene junio? Responde con números	30	es
P000043	¿Cuántos días tiene julio? Responde con números	31	es
P000044	¿Cuántos días tiene agosto? Responde con números	31	es
P000045	¿Cuántos días tiene setiembre? Responde con números	30	es
P000046	¿Cuántos días tiene octubre? Responde con números	31	es
P000047	¿Cuántos días tiene noviembre? Responde con números	30	es
P000048	¿Cuántos días tiene diciembre? Responde con números	31	es
P000049	Hola dijo Bartola; ¿quién dijo hola?	Bartola	es
P000050	¿Cuál palabra es un color: amarillo, abejorro, mono?	amarillo	es
P000051	¿Cuál palabra es un color: violeta, araña, morsa?	violeta	es
P000052	¿Cuál palabra es un color: blanco, alce, mosca?	blanco	es
P000053	¿Cuál palabra es un color: azul, almeja, mosquito?	azul	es
P000054	¿Cuál palabra es un color: rojo, ardilla, casa?	rojo	es
P000055	¿Cuál palabra es un color: negro, vaca, auto?	negro	es
\.


--
-- Data for Name: ae_recursos; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_recursos (id, cant_dias_a_generar, descripcion, dias_inicio_ventana_internet, dias_inicio_ventana_intranet, dias_ventana_internet, dias_ventana_intranet, fecha_baja, fecha_fin, fecha_fin_disp, fecha_inicio, fecha_inicio_disp, largo_lista_espera, mostrar_numero_en_llamador, mostrar_numero_en_ticket, nombre, reserva_multiple, sabado_es_habil, serie, usar_llamador, ventana_cupos_minimos, version, visible_internet, aeag_id, oficina_id, direccion, localidad, departamento, telefonos, horarios, latitud, longitud, mostrar_id_en_ticket) FROM stdin;
\.


--
-- Data for Name: ae_reservas; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_reservas (id, estado, fact, fcrea, numero, observaciones, origen, ucancela, ucrea, version, codigo_seguridad, trazabilidad_guid) FROM stdin;
\.


--
-- Data for Name: ae_reservas_disponibilidades; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_reservas_disponibilidades (aers_id, aedi_id) FROM stdin;
\.


--
-- Data for Name: ae_serv_autocomp_por_dato; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_serv_autocomp_por_dato (id, fecha_desasociacion, nombre_parametro, aeds_id, aesr_id) FROM stdin;
\.


--
-- Data for Name: ae_serv_autocompletar; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_serv_autocompletar (id, descripcion, fecha_baja, host, nombre, servicio) FROM stdin;
\.


--
-- Data for Name: ae_servicio_por_recurso; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_servicio_por_recurso (id, fecha_baja, aeserv_id, aere_id) FROM stdin;
\.


--
-- Data for Name: ae_textos; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_textos (codigo, idioma, texto) FROM stdin;
\.


--
-- Data for Name: ae_textos_agenda; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_textos_agenda (id, texto_paso1, texto_paso2, texto_paso3, texto_sel_recurso, texto_ticket, aeag_id, texto_correo_conf, texto_correo_canc, por_defecto, idioma) FROM stdin;
\.


--
-- Data for Name: ae_textos_recurso; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_textos_recurso (id, texto_paso2, texto_paso3, ticket_etiqueta_dos, ticket_etiqueta_uno, titulo_ciudadano_en_llamador, titulo_puesto_en_llamador, valor_etiqueta_dos, valor_etiqueta_uno, aere_id, idioma) FROM stdin;
\.


--
-- Data for Name: ae_validaciones; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_validaciones (id, descripcion, fecha_baja, host, nombre, servicio) FROM stdin;
\.


--
-- Data for Name: ae_validaciones_por_dato; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_validaciones_por_dato (id, fecha_desasociacion, nombre_parametro, aeds_id, aevr_id) FROM stdin;
\.


--
-- Data for Name: ae_validaciones_por_recurso; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_validaciones_por_recurso (id, fecha_baja, orden_ejecucion, aere_id, aeva_id) FROM stdin;
\.


--
-- Data for Name: ae_valor_constante_val_rec; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_valor_constante_val_rec (id, fecha_desasociacion, nombre_constante, valor, aevr_id) FROM stdin;
\.


--
-- Data for Name: ae_valores_del_dato; Type: TABLE DATA; Schema: empresa1; Owner: sae
--

COPY ae_valores_del_dato (id, etiqueta, fecha_desde, fecha_hasta, orden, valor, aeds_id, borrar_flag) FROM stdin;
\.


--
-- Name: s_ae_accion; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_accion', 1, false);


--
-- Name: s_ae_acciondato; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_acciondato', 1, false);


--
-- Name: s_ae_accionrecurso; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_accionrecurso', 1, false);


--
-- Name: s_ae_agenda; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_agenda', 2, true);


--
-- Name: s_ae_agrupacion_dato; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_agrupacion_dato', 1, true);


--
-- Name: s_ae_anio; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_anio', 1, false);


--
-- Name: s_ae_atencion; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_atencion', 1, true);


--
-- Name: s_ae_comunicaciones; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_comunicaciones', 1, true);


--
-- Name: s_ae_constval; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_constval', 1, false);


--
-- Name: s_ae_datoasolicitar; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_datoasolicitar', 1, true);


--
-- Name: s_ae_datodelrecurso; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_datodelrecurso', 1, true);


--
-- Name: s_ae_datoreserva; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_datoreserva', 1, true);


--
-- Name: s_ae_dia_mes; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_dia_mes', 1, false);


--
-- Name: s_ae_dia_semana; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_dia_semana', 1, false);


--
-- Name: s_ae_disponibilidad; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_disponibilidad', 1, true);


--
-- Name: s_ae_llamada; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_llamada', 1, true);


--
-- Name: s_ae_mes; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_mes', 1, false);


--
-- Name: s_ae_paramaccion; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_paramaccion', 1, false);


--
-- Name: s_ae_parametros_autocompletar; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_parametros_autocompletar', 1, false);


--
-- Name: s_ae_paramval; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_paramval', 1, false);


--
-- Name: s_ae_plantilla; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_plantilla', 1, false);


--
-- Name: s_ae_recurso; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_recurso', 1, true);


--
-- Name: s_ae_reserva; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_reserva', 1, true);


--
-- Name: s_ae_serv_autocompletar; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_serv_autocompletar', 1, false);


--
-- Name: s_ae_servdato; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_servdato', 1, false);


--
-- Name: s_ae_servrecurso; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_servrecurso', 1, false);


--
-- Name: s_ae_texto_agenda; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_texto_agenda', 1, true);


--
-- Name: s_ae_textorecurso; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_textorecurso', 1, true);


--
-- Name: s_ae_valconstante; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_valconstante', 1, false);


--
-- Name: s_ae_valdato; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_valdato', 1, false);


--
-- Name: s_ae_validacion; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_validacion', 1, false);


--
-- Name: s_ae_valorposible; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_valorposible', 1, true);


--
-- Name: s_ae_valrecurso; Type: SEQUENCE SET; Schema: empresa1; Owner: sae
--

SELECT pg_catalog.setval('s_ae_valrecurso', 1, false);


SET search_path = global, pg_catalog;

--
-- Data for Name: ae_captchas; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_captchas (clave, fase) FROM stdin;
\.


--
-- Data for Name: ae_configuracion; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_configuracion (clave, valor) FROM stdin;
WS_TRAZABILIDAD_URLSTS	
WS_TRAZABILIDAD_ROL	
WS_TRAZABILIDAD_POLICY	
WS_TRAZABILIDAD_ORG_KS_PATH	
WS_TRAZABILIDAD_ORG_KS_PASS	
WS_TRAZABILIDAD_ORG_KS_ALIAS	
WS_TRAZABILIDAD_SSL_KS_PATH	
WS_TRAZABILIDAD_SSL_KS_PASS	
WS_TRAZABILIDAD_SSL_KS_ALIAS	
WS_TRAZABILIDAD_SSL_TS_PATH	
WS_TRAZABILIDAD_SSL_TS_PASS	
WS_TRAZABILIDAD_WSATO_LINEA	http://testservicios.pge.red.uy/agesic/LineaService/preprod
WS_TRAZABILIDAD_WSAACTION_CABEZAL	http://ws.web.bruto.itramites.agesic.gub.uy/cabezalService/persist
WS_TRAZABILIDAD_WSAACTION_LINEA	http://ws.web.bruto.itramites.agesic.gub.uy/lineaService/persist
WS_TRAZABILIDAD_WSATO_CABEZAL	http://testservicios.pge.red.uy/agesic/cabezalService/preprod
WS_NOVEDADES_WSATO	http://testservicios.pge.red.uy/SAENovedades/publicacion
WS_NOVEDADES_WSAACTION	http://testservicios.pge.red.uy/SAENovedades/publicacion/nuevaNovedad
WS_TRAZABILIDAD_TIMEOUT	3500
WS_TRAZABILIDAD_MAXINTENTOS	10
WS_NOVEDADES_MAXINTENTOS	10
WS_NOVEDADES_ORG_KS_ALIAS	
WS_NOVEDADES_ORG_KS_PASS	
WS_NOVEDADES_ORG_KS_PATH	
WS_NOVEDADES_POLICY	
WS_NOVEDADES_ROL	
WS_NOVEDADES_SSL_KS_ALIAS	
WS_NOVEDADES_SSL_KS_PASS	
WS_NOVEDADES_SSL_KS_PATH	
WS_NOVEDADES_SSL_TS_PASS	
WS_NOVEDADES_SSL_TS_PATH	
WS_NOVEDADES_TIMEOUT	3500
WS_NOVEDADES_URLSTS	
WS_NOVEDADES_PRODUCTOR	AGESIC
WS_NOVEDADES_TOPICO	SAENovedades
WS_NOVEDADES_HABILITADO	FALSE
WS_TRAZABILIDAD_HABILITADO	TRUE
IDIOMAS_SOPORTADOS	es
WS_TRAZABILIDAD_VERSION	101
WS_TRAMITE_USER	nacho
WS_TRAMITE_PASS	1234
\.


--
-- Data for Name: ae_empresas; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_empresas (id, nombre, datasource, fecha_baja, org_id, org_codigo, org_nombre, unej_id, unej_codigo, unej_nombre, logo, cc_finalidad, cc_responsable, cc_direccion, logo_texto, timezone, formato_fecha, formato_hora, oid, pie_publico) FROM stdin;
2	Empresa 1	empresa1	\N	0	0	No configurado	0	0	No\nconfigurado	\N	No configurado	No configurado	No configurado	No\nconfigurado	GMT	dd/MM/yyyy	HH:mm	No configurado	
\.


--
-- Data for Name: ae_novedades; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_novedades (fecha_creacion, fecha_ult_intento, intentos, datos, enviado, id, reserva_id, empresa_id) FROM stdin;
\.


--
-- Data for Name: ae_oficinas; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_oficinas (id, tramite_id, nombre, direccion, localidad, departamento, telefonos, horarios, comentarios) FROM stdin;
\.


--
-- Data for Name: ae_organismos; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_organismos (id, codigo, nombre) FROM stdin;
\.


--
-- Data for Name: ae_rel_usuarios_empresas; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_rel_usuarios_empresas (usuario_id, empresa_id) FROM stdin;
\.


--
-- Data for Name: ae_rel_usuarios_roles; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_rel_usuarios_roles (usuario_id, empresa_id, rol_nombre) FROM stdin;
\.


--
-- Data for Name: ae_textos; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_textos (codigo, texto) FROM stdin;
ingrese_al_sistema	Ingrese al Sistema de Agenda electrónica
string	Texto
contrasena	Contraseña
ingresar	Ingresar
ingrese_usuario_y_contrasena	Ingrese su código de usuario y contraseña
saltar_al_contenido	Saltar al contenido
empresa	Empresa
agenda	Agenda
seleccionar	Seleccionar
recurso	Recurso
usuario	Usuario
cerrar_sesion	Cerrar sesión
menu	Menu
nombre_aplicacion	SAE - Sistema de Agenda Electrónica
informacion_adicional	Información adicional
elegir_dia_y_hora	Elegir día y hora
volver_a_la_pagina_principal	Volver a la página principal
nueva_reserva	Nueva reserva
detalle_y_ubicacion	Detalle y ubicación
dia_y_hora	Día y hora
datos_necesarios	Datos necesarios
confirmacion	Confirmación
seleccione_el_dia	Seleccione el día de su preferencia haciendo click con el mouse
debajo_del_calendario_horarios_disponibles	Luego de seleccionar el día, debajo del calendario se mostrarán los horarios disponibles para ese día
seleccione_un_horario	Seleccione un horario para continuar con la reserva
preferencia_de_horario	Preferencia de horario
cualquier_horario	Cualquier horario
solo_matutino	Solo por la mañana
solo_vespertino	Solo por la tarde
seleccione_un_dia	Seleccione un día
horarios_diponibles	Horarios diponibles
por_la_manana	Por la mañana
por_la_tarde	Por la tarde
completar_datos	Completar datos
datos_marcados_obligatorios	Los datos que estén marcados con un asterisco (*) son obligatorios
clausula_de_consentimiento_informado	Cláusula de consentimiento informado
terminos_de_la_clausula	Términos de la cláusula
acepto_los_terminos	Acepto los términos
no_acepto_los_terminos	No acepto los términos
confirmar_reserva	Confirmar reserva
reserva_confirmada	Su reserva está confirmada
guardar_ticket	Guardar ticket
imprimir_ticket	Imprimir ticket
cancelar_reserva	Cancelar reserva
a_las	a las
confirma_cancelar_la_reserva	¿Esta seguro que desea cancelar la reserva?
cancelar_reserva_para_agenda	Cancelar reserva para
continuar	Continuar
su_reserva	Su reserva
debe_especificar_la_empresa	Debe especificar la empresa
dias_con_turnos_disponibles	Los días marcados en color verde tienen turnos disponibles
codigo_de_seguridad	Código de cancelación
codigo_de_seguridad_de_la_reserva	Código de cancelación de la reserva
la_combinacion_de_parametros_especificada_no_es_valida	La combinación de parámetros especificada no es válida
no_se_pudo_registrar_un_usuario_anonimo	No se pudo registrar un usuario anónimo para permitir esta invocación
la_empresa_especificada_no_es_valida	La empresa especificada no es válida
la_agenda_especificada_no_es_valida	La agenda especificada no es válida
no_se_encuentra_la_reserva_o_ya_fue_cancelada	No se encuentra la reserva o la misma ya fue cancelada
ingrese_el_codigo_de_seguridad	Ingrese el código de cancelación
el_recurso_especificado_no_es_valido	El recurso especificado no es válido
debe_ingresar_codigo_de_seguridad	Debe ingresar el código de cancelación
debe_ingresar_al_menos_dos_de_los_datos_solicitados	Debe ingresar al menos dos de los datos solicitados en la reserva
debe_especificar_la_agenda	Debe especificar la agenda.
debe_especificar_el_recurso	Debe especificar el recurso
no_se_encontraron_reservas	No se encontraron reservas
debe_especificar_la_reserva	Debe especificar la reserva
no_es_posible_cancelar_la_reserva	No es posible cancelar la reserva
reserva_cancelada_correctamente	Reserva cancelada correctamente
la_agenda_especificada_no_tiene_recursos	La agenda especificada no tiene recursos disponibles
recurso_no_habilitado_para_ser_accedido_desde_internet	El recurso especificado no está habilitado para ser accedido desde internet
acceso_denegado	Acceso denegado
sistema_en_mantenimiento	Sistema en mantenimiento. Por favor intente nuevamente más tarde
sin_disponibilidades	No hay disponibilidades para la opción seleccionada
clausula_de_consentimiento_informado_texto	De conformidad con la Ley N° 18.331, de 11 de agosto de 2008, de Protección de Datos Personales y Acción de Habeas Data (LPDP), los datos suministrados por usted quedarán incorporados en una base de datos, la cual será procesada exclusivamente para la siguiente finalidad: {finalidad}. "Los datos personales serán tratados con el grado de protección adecuado, tomándose las medidas de seguridad necesarias para evitar su alteración, pérdida, tratamiento o acceso no autorizado por parte de terceros que lo puedan utilizar para finalidades distintas para las que han sido solicitadas al usuario. El responsable de la base de datos es {responsable} y la dirección donde podrá ejercer los derechos de acceso, rectificación, actualización, inclusión o supresión, es {direccion}, según lo establecido en la LPDP.
debe_aceptar_los_terminos_de_la_clausula_de_consentimiento_informado	Debe aceptar los términos de la cláusula de consentimiento informado para poder continuar
ticket_de_reserva	Ticket de reserva
fecha	Fecha
hora	Hora
serie	Serie
numero	Número
reserva_realizada_el	Reserva realizada el día
debe_seleccionar_un_horario	Debe seleccionar un día y una hora
ingrese_el_texto_que_aparece_en_la_imagen	Ingrese el texto que aparece en la imagen
debe_ingresar_el_texto_que_aparece_en_la_imagen	Debe ingresar el texto que aparece en la imagen
verificacion_de_seguridad	Verificación de seguridad
esta_seguro_que_desea_eliminar_la_empresa	¿Está seguro que desea eliminar la empresa?
eliminar	Eliminar
cancelar	Cancelar
listado_de_empresas	Listado de empresas
identificador	Identificador
nombre	Nombre
acciones	Acciones
booleano	Sí/No
lista	Lista desplegable
datos_de_la_empresa	Datos de la empresa
organismo	Organismo
codigo	Código
recargar_listado	Recargar listado
unidad_ejecutora	Unidad ejecutora
logo	Logo
dias_de_inicio_de_la_ventana_de_intranet	Días requeridos antes de comenzar a agendar
subir	Subir
logo_texto_alternativo	Texto alternativo del logo
zona_horaria	Zona horaria
formato_de_fecha	Formato de fecha
formato_de_hora	Formato de hora
origen_de_datos	Origen de datos
datos_para_la_clausula_de_consentimiento	Datos para la cláusula de consentimiento
finalidad	Finalidad
responsable	Responsable
direccion	Dirección
guardar	Guardar
esta_seguro_que_desea_eliminar_el_usuario	¿Está seguro que desea eliminar el usuario?
listado_de_usuarios	Listado de usuarios
cedula_de_identidad	Cédula de identidad
nombre_y_apellido	Nombre y apellido
correo_electronico	Correo electrónico
modificar	Modificar
datos_del_usuario	Datos del usuario
superadministrador	Superadministrador
enviar_por_correo	Enviar por correo
roles_del_usuario_en_la_empresa	Roles del usuario en la empresa
administrador	Administrador
planificador	Planificador
funcionario_de_call_center	Funcionario de call center
funcionario_de_atencion	Funcionario de atención
llamador	Llamador
datos_de_la_agenda	Datos de la agenda
dias_de_la_ventana_de_intranet	Duración de la ventana para agendar
tramite	Trámite
descripcion	Descripción
misma_que_la_de_la_empresa	Misma que la de la empresa
dias_de_inicio_de_la_ventana_de_internet	Días requeridos antes de comenzar a agendar
listado_de_agendas	Listado de agendas
copiar	Copiar
etiquetas	Etiquetas
nomenclatura_para_recurso	Nomenclatura para 'Recurso' (p.e. 'Oficina', 'Centro' o 'Sucursal')
texto_paso_1	Texto paso 1
texto_para_el_paso_1_de_la_reserva	Texto para el paso 1 de la reserva
texto_paso_2	Texto paso 2
texto_para_el_paso_2_de_la_reserva	Texto para el paso 2 de la reserva
texto_paso_3	Texto paso 3
texto_para_el_paso_3_de_la_reserva	Texto para el paso 3 de la reserva
texto_para_el_ticket_de_reserva	Texto para el ticket de reserva
correo_de_confirmacion	Correo de confirmación
texto_para_el_correo_de_confirmacion	Texto para el correo de confirmación
correo_de_cancelacion	Correo de cancelación
texto_para_el_correo_de_cancelacion	Texto para el correo de cancelación
empresas	Empresas
crear_empresa	Crear empresa
consultar_empresas	Consultar empresas
usuarios	Usuarios
crear_usuario	Crear usuario
consultar_usuarios	Consultar usuarios
agendas	Agendas
crear_agenda	Crear agenda
consultar_agendas	Consultar agendas
modificar_textos_de_agendas	Modificar textos de agendas
recursos	Recursos
crear_recurso	Crear recurso
consultar_recursos	Consultar recursos
modificar_textos_de_recursos	Modificar textos de recursos
datos_a_solicitar	Datos a solicitar
agrupaciones	Agrupaciones
crear_dato	Crear dato
consultar_datos	Consultar datos
disponibilidades	Disponibilidades
consultar_disponibilidades	Consultar disponibilidades
generar_un_dia	Generar un día
copiar_dia	Copiar día
modificar_cupos	Modificar cupos
eliminar_disponibilidades	Eliminar disponibilidades
reservas	Reservas
reservar	Reservar
considerar_el_sabado_como_dia_habil	Considerar como día hábil
lista_de_espera	Lista de espera
abrir_llamador	Abrir llamador
oficina	Oficina
localidad	Localidad
departamento	Departamento
latitud	Latitud
longitud	Longitud
telefonos	Teléfonos
horarios	Horarios
inicio_de_vigencia	Inicio de vigencia
fin_de_vigencia	Fin de vigencia
cupos_minimos_de_la_ventana	Cupos mínimos de la ventana
cantidad_de_dias_a_generar	Cantidad de días a generar
listado_de_recursos	Listado de recursos
esta_seguro_que_desea_eliminar_el_dato	¿Está seguro que desea eliminar el dato?
informacion_adicional_del_recurso	Información adicional del recurso
agregar_informacion	Agregar información
orden	Orden
etiqueta	Etiqueta
valor	Valor
modificar_dato	Modificar dato
agregar_dato	Agregar dato
volver	Volver
esta_seguro_que_desea_eliminar_el_recurso	¿Está seguro que desea eliminar el recurso?
textos_del_llamador	Textos del llamador
titulo_de_la_columna_de_datos	Título de la columna de datos
titulo_de_la_columna_del_puesto	Título de la columna del puesto
esta_seguro_que_desea_eliminar_la_agenda	¿Esta seguro que desea eliminar la agenda?
esta_seguro_que_desea_eliminar_la_agrupacion	¿Esta seguro que desea eliminar la agrupación?
agregar_agrupacion	Agregar agrupación
listado_de_agrupaciones	Listado de agrupaciones
agenda_creada	Agenda creada
modificar_agrupacion	Modificar agrupación
crear_agrupacion	Crear agrupación
vista_preliminar_del_formulario_de_ingreso_de_datos_de_la_reserva	Vista preliminar del formulario de ingreso de datos de la reserva
ver_diseno	Ver diseño
datos_generales	Datos generales
texto_de_ayuda	Texto de ayuda
tipo_de_dato	Tipo de dato
largo_maximo	Largo máximo
requerido	Requerido
clave	Clave
agrupacion	Agrupación
fila	Fila
diseno_del_formulario	Diseño del formulario
diseno_del_reporte	Diseño del reporte
incluir_en_el_reporte	Incluir en el reporte
ancho	Ancho
diseno_del_llamador	Diseño del llamador
incluir_en_el_llamador	Incluir en el llamador
largo	Largo
esta_seguro_que_desea_eliminar_el_campo	¿Esta seguro que desea eliminar el campo?
esta_seguro_que_desea_eliminar_el_valor	¿Esta seguro que desea eliminar el valor?
valores_posibles_para_el_dato	Valores posibles para el dato
agregar_valor	Agregar valor
vigencia_desde	Vigencia desde
vigencia_hasta	Vigencia hasta
modificar_valor_posible	Modificar valor posible
crear_valor_posible	Crear valor posible
aplicar_a_todos_los_dias	Todos los días subsiguientes
agenda_eliminada	Agenda eliminada
desde	Desde
hasta	Hasta
consultar	Consultar
disponibilidades_en_periodo_consultado	Disponibilidades en período consultado
cupos_disponibles	Cupos disponibles
ver_detalles	Ver detalles
disponibilidades_para_el_dia	Disponibilidades para el día
disponibilidades_por_la_manana	Disponibilidades por la mañana
hora_de_inicio	Hora de inicio
cupos_totales	Cupos totales
cantidad_de_reservas	Cantidad de reservas
disponibilidades_por_la_tarde	Disponibilidades por la tarde
periodo_a_consultar	Período a consultar
fecha_para_la_cual_generar	Fecha para la cual generar
nuevas_disponibilidades_para_la_fecha_consultada	Nuevas disponibilidades para la fecha consultada
frecuencia	Frecuencia
crear_disponibilidades	Crear disponibilidades
seleccionar_la_fecha_modelo	Seleccionar la fecha modelo
periodo_para_el_cual_generar	Período para el cual generar
fecha_de_inicio	Fecha de inicio
fecha_de_fin	Fecha de fin
esta_seguro_que_desea_modificar_las_disponibilidades_marcadas	¿Esta seguro que desea modificar las disponibilidades marcadas?
fecha_para_la_cual_modificar	Fecha para la cual modificar
todas_las_horas_del_turno_matutino	Todas las horas del turno matutino
todas_las_horas_del_turno_vespertino	Todas las horas del turno vespertino
modificacion_de_disponibilidades_para_las_horas_seleccionadas	Modificación de disponibilidades para las horas seleccionadas
horarios_seleccionados	Horarios seleccionados
operacion_a_realizar	Operación a realizar
aumentar_disponibilidades_en_la_cantidad_especificada	Aumentar disponibilidades en la cantidad especificada
disminuir_disponibilidades_en_la_cantidad_especificada	Disminuir disponibilidades en la cantidad especificada
establecer_disponibilidades_en_la_cantidad_especificada	Establecer disponibilidades en la cantidad especificada
cantidad_de_cupos	Cantidad de cupos
seleccionar_semana	Seleccionar semana
semana	Semana
disponibilidades_para_la_semana_consultada	Disponibilidades para la semana consultada
eliminar_disponibilidades_de_toda_la_semana	Eliminar disponibilidades de toda la semana
hora_de_fin	Hora de fin
seleccione_ubicacion	Seleccione ubicación
seleccione_dia_y_hora	Seleccione día y hora
disponibilidades_en_la_manana	Disponibilidades en la mañana
disponibilidades_en_la_tarde	Disponibilidades en la tarde
la_reserva_esta_confirmada	La reserva está confirmada
si	Sí
no	No
documento	Documento
llamar_al_siguiente	Llamar al siguiente
mostrar	Mostrar
no_hay_personas_en_espera	No hay personas en espera
volver_a_llamar	Volver a llamar
falto	Faltó
asistio	Asistió
tamano_de_la_pantalla	Tamaño de la pantalla
numero_de_puesto	Número de puesto
debe_haber_una_agenda_seleccionada	Debe haber una agenda seleccionada
agrupacion_modificada	Agrupación modificada
debe_haber_una_agrupacion_seleccionada	Debe haber una agrupación seleccionada
agrupacion_eliminada	Agrupación eliminada
debe_haber_un_recurso_seleccionado	Debe haber un recurso seleccionado
el_nombre_de_la_agrupacion_es_obligatorio	El nombre de la agrupación es obligatorio
agrupacion_creada	Agrupación creada
disponibilidades_creadas	Disponibilidades creadas
error_de_acceso_concurrente	Error de acceso concurrente. Intente más tarde.
campo_modificado	Campo modificado
campo_eliminado	Campo eliminado
dato_creado	Dato creado
valor_modificado	Valor modificado
valor_eliminado	Valor eliminado
valor_creado	Valor creado
datos_correctos	Datos correctos, las validaciones se han ejecutado con éxito
disponibilidades_modificadas	Disponibilidades modificadas
agenda_modificada	Agenda modificada
disponibilidades_eliminadas	Disponibilidades eliminadas
empresa_creada	Empresa creada
empresa_modificada	Empresa modificada
recurso_creado	Recurso creado
recurso_eliminado	Recurso eliminado
recurso_copiado	Recurso copiado
recurso_modificado	Recurso modificado
dato_modificado	Dato modificado
debe_haber_un_dato_seleccionado	Debe haber un dato seleccionado
dato_eliminado	Dato eliminado
reserva_cancelada	Reserva cancelada
usuario_creado	Usuario creado
usuario_modificado	Usuario modificado
debe_haber_un_usuario_seleccionado	Debe haber un usuario seleccionado
la_contrasena_fue_enviada	La contraseña fue enviada al usuario
el_nombre_de_la_agenda_es_obligatorio	El nombre de la agenda es obligatorio
la_fecha_es_obligatoria	La fecha es obligatoria
la_hora_de_inicio_es_obligatoria	La hora de inicio es obligatoria
la_hora_de_fin_es_obligatoria	La hora de fin es obligatoria
debe_crear_al_menos_una_agrupacion	Antes de crear datos a solicitar debe crear al menos una agrupación
no_se_permite_eliminar_esta_agrupacion	No se permite eliminar esta agrupación
no_se_permite_eliminar_este_dato	No se permite eliminar este dato
el_nombre_del_dato_es_obligatorio	El nombre del dato es obligatorio
debe_seleccionar_un_valor	Debe seleccionar un valor
no_se_permite_eliminar_este_valor	No se permite eliminar este valor
el_nombre_del_valor_es_obligatorio	El nombre del valor es obligatorio
solo_se_permiten_letras_y_numeros	Solo se permiten letras y números
codigo_de_usuario	Cédula de identidad
no_se_pudo_obtener_la_ultima_fecha_generada	No se pudo obtener la última fecha generada
solo_se_permiten_hasta_5_caracteres	Solo se permiten hasta 5 caracteres
la_fecha_de_inicio_es_obligatoria	La fecha de inicio es obligatoria
la_fecha_de_fin_es_obligatoria	La fecha de fin es obligatoria
la_fecha_de_fin_debe_ser_posterior_a_la_fecha_de_inicio	La fecha de fin debe ser posterior a la fecha de inicio
debe_seleccionar_al_menos_una_disponibilidad	Debe seleccionar al menos una disponibilidad
no_hay_disponibilidades_para_la_opcion_seleccionada	No hay disponibilidades para la opción seleccionada
debe_seleccionar_un_horario_con_disponibilidades	Debe seleccionar un horario con disponibilidades
el_nombre_del_recurso_es_obligatorio	El nombre del recurso es obligatorio
la_descripcion_del_recurso_es_obligatoria	La descripción del recurso es obligatoria
los_dias_de_inicio_de_la_ventana_de_intranet_es_obligatorio	Los días de inicio de la ventana de intranet es obligatorio
los_dias_de_inicio_de_la_ventana_de_intranet_debe_ser_mayor_a_cero	Los días de inicio de la ventana de intranet debe ser mayor a cero
los_dias_de_la_ventana_de_intranet_es_obligatorio	Los días de la ventana de intranet es obligatorio
los_dias_de_la_ventana_de_intranet_debe_ser_mayor_a_cero	Los días de la ventana de intranet debe ser mayor a cero
los_dias_de_la_ventana_de_internet_debe_ser_mayor_a_cero	Los días de la ventana de internet debe ser mayor a cero
version	Versión
los_dias_de_la_ventana_de_internet_es_obligatorio	Los días de la ventana de internet es obligatorio
los_dias_de_inicio_de_la_ventana_de_internet_debe_ser_mayor_a_cero	Los días de inicio de la ventana de internet debe ser mayor a cero
los_dias_de_inicio_de_la_ventana_de_internet_es_obligatorio	Los días de inicio de la ventana de internet es obligatorio
la_cantidad_de_cupos_minimos_es_obligatoria	La cantidad de cupos mínimos es obligatoria
la_cantidad_de_cupos_minimos_debe_ser_mayor_o_igual_a_cero	La cantidad de cupos mínimos debe ser mayor o igual a cero
la_cantidad_de_dias_a_generar_es_obligatoria	La cantidad de días a generar es obligatoria
la_cantidad_de_dias_a_generar_debe_ser_mayor_a_cero	La cantidad de días a generar debe ser mayor a cero
la_cantidad_de_dias_a_generar_debe_ser_mayor_o_igual_que_la_suma_internet	La cantidad de días a generar debe ser mayor o igual que la suma de los días de inicio de la ventana de internet y los días de la ventana de internet
la_cantidad_de_dias_a_generar_debe_ser_mayor_o_igual_que_la_suma_intranet	La cantidad de días a generar debe ser mayor o igual que la suma de los días de inicio de la ventana de intranet y los días de la ventana de intranet
el_largo_de_la_lista_de_espera_debe_ser_mayor_que_cero	El largo de la lista de espera debe ser mayor que cero
ya_existe_un_recurso_con_el_nombre_especificado	Ya existe un recurso con el nombre especificado
la_fecha_de_inicio_de_disponibilidad_debe_ser_posterior_a_la_fecha_de_inicio	La fecha de inicio de disponibilidad debe ser posterior a la fecha de inicio
la_etiqueta_del_dato_es_obligatoria	La etiqueta del dato es obligatoria
debe_seleccionar_una_reserva	Debe seleccionar una reserva
el_codigo_del_organismo_es_obligatorio	El código del organismo es obligatorio
el_nombre_de_la_empresa_es_obligatorio	El nombre de la empresa es obligatorio
el_origen_de_datos_de_la_empresa_es_obligatorio	El origen de datos de la empresa es obligatorio
la_finalidad_para_la_clausula_de_consentimiento_informado_es_obligatoria	La finalidad para la cláusula de consentimiento informado es obligatoria
la_direccion_para_la_clausula_de_consentimiento_informado_es_obligatoria	La dirección para la cláusula de consentimiento informado es obligatoria
el_responsable_para_la_clausula_de_consentimiento_informado_es_obligatorio	El responsable para la cláusula de consentimiento informado es obligatorio
ya_existe_una_empresa_con_el_nombre_especificado	Ya existe una empresa con el nombre especificado
no_se_puede_obtener_los_tramites_porque_la_empresa_no_esta_asociada_a_ningun_organismo	No se puede obtener los tramites porque la empresa no está asociada a ningún organismo
empresa_eliminada	Empresa eliminada
la_fecha_de_inicio_debe_ser_igual_o_posterior_a_la_fecha_de_inicio_de_la_disponibilidad_del_recurso	La fecha de inicio debe ser igual o posterior a la fecha de inicio de la disponibilidad del recurso
no_es_posible_confirmar_su_reserva	No es posible confirmar su reserva, solicite ayuda en forma telefónica
no_es_posible_cancelar_sus_reservas_anteriores	No es posible cancelar sus reservas anteriores, solicite ayuda en forma telefónica
ya_tiene_una_reserva_para_el_dia	Ya tiene una reserva para el día
los_caracteres_escritos_no_son_correctos	Los caracteres escritos no coinciden con el texto que aparece en la imagen
debe_completar_el_campo_campo	Debe completar el campo {campo}
imagen_de_seguridad	Imagen de seguridad
el_nombre_del_usuario_es_obligatorio	El nombre del usuario es obligatorio
el_correo_electronico_del_usuario_es_obligatorio	El correo electrónico del usuario es obligatorio
ya_existe_una_agenda_con_el_nombre_especificado	Ya existe una agenda con el nombre especificado
la_descripcion_de_la_agenda_es_obligatoria	La descripción de la agenda es obligatoria
no_se_encuentra_la_agenda_especificada	No se encuentra la agenda especificada
no_se_puede_eliminar_la_agenda_porque_hay_recursos_vivos	No se puede eliminar la agenda porque hay recursos vivos
no_se_puede_eliminar_la_agenda_porque_hay_reservas_vivas	No se puede eliminar la agenda porque hay reservas vivas
no_se_puede_eliminar_el_recurso_porque_hay_disponibilidades_vivas	No se puede eliminar el recurso porque hay disponibilidades vivas
no_se_puede_eliminar_el_recurso_porque_hay_reservas_vivas	No se puede eliminar el recurso porque hay reservas vivas
no_se_puede_eliminar_el_recurso_porque_hay_agrupaciones_de_datos_vivas	No se puede eliminar el recurso porque hay agrupaciones de datos vivas
no_se_puede_eliminar_el_recurso_porque_hay_validaciones_vivas	No se puede eliminar el recurso porque hay validaciones vivas
no_se_encuentra_el_recurso_especificado	No se encuentra el recurso especificado
ya_existe_una_agrupacion_con_el_nombre_especificado	Ya existe una agrupación con el nombre especificado
no_se_encuentra_la_empresa_especificada	No se encuentra la empresa especificada
no_se_encuentra_la_agrupacion_especificada	No se encuentra la agrupación especificada
el_tipo_del_dato_es_obligatorio	El tipo del dato es obligatorio
la_fila_del_dato_es_obligatoria	La fila del dato es obligatoria
la_columna_del_dato_es_obligatoria	La columna del dato es obligatoria
el_largo_del_dato_es_obligatorio	El largo del dato es obligatorio
el_ancho_de_despliegue_es_obligatorio	El ancho de despliegue es obligatorio
el_ancho_de_despliegue_debe_ser_mayor_a_cero	El ancho de despliegue debe ser mayor a cero
el_orden_en_el_llamador_es_obligatorio	El orden en el llamador es obligatorio
la_fila_del_dato_debe_ser_mayor_a_cero	La fila del dato debe ser mayor a cero
ya_existe_un_dato_con_el_nombre_especificado	Ya existe un dato con el nombre especificado
el_largo_del_dato_debe_ser_mayor_a_cero	El largo del dato debe ser mayor a cero
el_orden_en_el_llamador_debe_ser_mayor_a_cero	El orden en el llamador debe ser mayor a cero
el_valor_del_dato_es_obligatorio	El valor del dato es obligatorio
el_orden_del_dato_es_obligatorio	El orden del dato es obligatorio
el_orden_del_dato_debe_ser_mayor_a_cero	El orden del dato debe ser mayor a cero
no_se_encuentra_el_dato_especificado	No se encuentra el dato especificado
ya_existe_otro_valor_con_la_misma_etiqueta_y_valor	Ya existe otro valor con la misma etiqueta o valor que se solapa en el período
no_hay_datos_para_mostrar	No hay datos para mostrar
la_hora_de_fin_debe_ser_posterior_a_la_hora_de_inicio	La hora de fin debe ser posterior a la hora de inicio
la_frecuencia_debe_ser_mayor_que_cero	La frecuencia debe ser mayor que cero
la_frecuencia_es_obligatoria	La frecuencia es obligatoria
el_cupo_total_es_obligatorio	El cupo total es obligatorio
el_cupo_total_debe_ser_mayor_a_cero	El cupo total debe ser mayor a cero
la_fecha_debe_ser_igual_o_posterior_a_la_fecha_de_inicio_de_la_disponibilidad_del_recurso	La fecha debe ser igual o posterior a la fecha de inicio de la disponibilidad del recurso
la_fecha_debe_ser_igual_o_anterior_a_la_fecha_de_fin_de_la_disponibilidad_del_recurso	La fecha debe ser igual o anterior a la fecha de fin de la disponibilidad del recurso
la_fecha_no_corresponde_a_un_dia_habil	La fecha no corresponde a un día hábil
ya_existe_alguna_disponibilidad_para_la_fecha_y_la_hora_de_inicio_especificadas	Ya existe alguna disponibilidad para la fecha y la hora de inicio especificadas
la_fecha_debe_estar_comprendida_en_el_periodo_fdesde_a_fhasta	La fecha debe estar comprendida en el período {fdesde} a {fhasta}
ya_existen_disponibilidades_para_algun_dia_en_el_periodo_especificado	Ya existen disponibilidades para algún día en el período especificado
no_existen_disponibilidades_generadas_para_la_fecha_especificada	No existen disponibilidades generadas para la fecha especificada
la_cantidad_de_dias_comprendidos_en_el_periodo_debe_ser_menor_que_la_cantidad_de_dias_a_generar_para	La cantidad de dias comprendidos en el período debe ser menor que la cantidad de dias a generar para el recurso
la_fecha_de_fin_debe_ser_igual_o_anterior_a_la_fecha_de_fin_de_la_disponibilidad_del_recurso	La fecha de fin debe ser igual o anterior a la fecha de fin de la disponibilidad del recurso
las_fechas_deben_estar_comprendidas_en_el_periodo_fdesde_a_fhasta_y_no_abarcar_mas_de_dias_dias	Las fechas deben estar comprendidas en el período {fdesde} a {fhasta} y no abarcar más de {dias} días
no_se_puede_eliminar_las_disponibilidades_porque_hay_reservas_vivas	No se puede eliminar las disponibilidades porque hay reservas vivas
no_hay_disponibilidades_para_el_periodo_especificado	No hay disponibilidades para el período especificado
esta_seguro_que_desea_eliminar_las_disponibilidades	¿Esta seguro que desea eliminar las disponibilidades?
el_oid_de_la_empresa_es_obligatorio	El OID de la empresa es obligatorio
empresa_oid_ayuda	Este dato puede consultarlo en http://unaoid.gub.uy
no_se_pudo_generar_las_comunicaciones	No se pudo generar las comunicaciones
oid	OID
no_se_encuentra_la_reserva_especificada	No se encuentra la reserva especificada
ya_existe_una_reserva_para_el_dia_especificado_con_los_datos_proporcionados	Ya existe una reserva para el día especificado con los datos proporcionados
hay_campos_obligatorios_sin_completar	Hay campos obligatorios sin completar
el_campo_campo_debe_contener_solo_digitos	El campo {campo} debe contener solo dígitos
no_se_pudo_consultar_el_servicio_web	No se pudo consultar el servicio web
ha_pasado_demasiado_tiempo_desde_su_ultima_accion	Ha pasado demasiado tiempo desde su última acción
no_se_puede_enviar_el_correo_porque_el_usuario_no_tiene_direccion_de_correo_electronico	No se puede enviar el correo porque el usuario no tiene dirección de correo electrónico
no_se_pudo_enviar_el_correo_electronico_de_confirmacion_tome_nota_de_los_datos_de_la_reserva	No se pudo enviar el correo electrónico de confirmación; tome nota de los datos de la reserva
codigo_de_trazabilidad	Código de trazabilidad
idioma	Idioma
idiomas_soportados	Idiomas soportados
no_se_puede_guardar_la_empresa_porque_no_existe_el_esquema	No se puede guardar la empresa porque no existe el origen de datos especificado
no_se_puede_modificar_las_fechas_porque_quedarian_disponibilidades_fuera_del_periodo_especificado	No se puede modificar las fechas porque quedarían disponibilidades fuera del período especificado
no_se_puede_modificar_las_fechas_porque_quedarian_reservas_fuera_del_periodo_especificado	No se puede modificar las fechas porque quedarían reservas fuera del período especificado
no_se_ha_definido_ningun_idioma_valido_para_la_agenda	No se ha definido ningún idioma válido para la agenda
establecer_como_idioma_por_defecto	Establecer como idioma por defecto
el_dia_y_la_hora_son_obligatorios	El día y la hora son obligatorios
el_numero_es_obligatorio	El número es obligatorio
el_numero_ingresado_no_es_valido	El número ingresado no es válido
personalizacion_de_apariencia	Personalización de la apariencia
pie_de_pagina_publico	Pie de página público
el_largo_en_el_llamador_es_obligatorio	El largo en el llamador es obligatorio
el_largo_en_el_llamador_debe_ser_mayor_a_cero	El largo en el llamador debe ser mayor a cero
sae	Sistema de Agenda Electrónica
consultas	Consultas
por_id.	Por identificador
por_numero	Por número
por_datos	Por datos
reporte	Reporte
reporte_asistencia	Reporte de asistencia
reporte_atencion_funcionario	Reporte de atención por funcionario
reporte_tiempo_atencion_funcionario	Reporte de tiempo de atención por funcionario
numero_de_la_reserva	Número de la reserva
id._de_la_reserva	Id. de la reserva
datos_de_la_reserva	Datos de la reserva
estado	Estado
observaciones	Observaciones
fecha_de_creacion	Fecha de creación
minutos	Minutos
id	Id
fecha_creacion	Fecha de creación
usuario_creacion	Usuario de creación
origen	Origen
accion	Acción
ver_detalle	Ver detalle
fecha_desde	Fecha desde
fecha_hasta	Fecha hasta
reporte_asistencia_por_periodo	Reporte de asistencia por período
reporte_atencion_por_periodo	Reporte de atención por período
reporte_tiempos_de_atencion	Reporte de tiempos de atención
fecha_y_numero_de_la_reserva	Fecha y número de la reserva
una_pagina_por_hora	Una página por hora
el_tamano_maximo_admitido_para_el_logo_es_de_1mb	El tamaño máximo admitido para el logo es de 1MB
el_texto_alternativo_del_logo_no_puede_estar_vacio	El texto alternativo del logo es obligatorio
la_cantidad_de_cupos_a_aumentar_no_puede_ser_cero	La cantidad de cupos a aumentar no puede ser cero
la_cantidad_de_cupos_a_disminuir_no_puede_ser_cero	La cantidad de cupos a disminuir no puede ser cero
no_se_permiten_valores_negativos	No se permiten valores negativos
el_campo_nombre_solo_puede_contener_letras_sin_tildes,_numeros_y__	El campo Nombre solo puede contener letras sin tildes, números y _
el_campo_nombre_no_puede_comenzar_con_un_numero	El campo Nombre no puede comenzar con un número
correo_electronico_no_valido	La dirección de correo electrónico no es válida
el_valor_para_el_campo_cantidad_de_cupos_debe_ser_numerico	El valor para el campo Cantidad de cupos debe ser numérico
el_largo_del_llamador_debe_ser_mayor_a_cero	El largo del llamador debe ser mayor a cero
ya_existe_una_empresa_con_el_mismo_valor_para_origen_de_datos	Ya existe una empresa con el mismo origen de datos
existe_una_empresa_eliminada_con_el_mismo_valor_para_origen_de_datos	Ya existe una empresa eliminada con el mismo origen de datos
la_fecha_debe_ser_posterior_a_la_fecha_fdesde	La fecha de fin debe ser posterior a la fecha de inicio
no_se_puede_eliminar_la_empresa_porque_hay_reservas_vivas	No se puede eliminar la empresa porque hay reservas vivas
mail_no_valido	La dirección de correo electrónica no es válida
continuar_tramite	Contrinuar con el trámite
mensajes_en_el_formulario_error	Hay {count} errores en el formulario que debe corregir
mensajes_en_el_formulario_warn	Hay {count} advertencias a las cuales debe prestar atención
mensajes_en_el_formulario_info	Ejecución exitosa
el_orden_de_la_agrupacion_es_obligatorio	El órden de la agrupación es obligatorio
el_orden_de_la_agrupacion_debe_ser_mayor_a_cero	El orden de la agrupación debe ser mayor a cero
no_se_puede_modifcar_una_agrupacion_eliminada	No se puede modifcar una agrupacion dada de baja
cual_es_la_palabra_1_de_la_frase	¿Cuál es la primera palabra de la frase "{frase}"?
cual_es_la_palabra_2_de_la_frase	¿Cuál es la segunda palabra de la frase "{frase}"?
cual_es_la_palabra_3_de_la_frase	¿Cuál es la tercera palabra de la frase "{frase}"?
la_agrupacion_ya_esta_eliminada	La agrupación ya está eliminada
no_se_puede_eliminar_la_agrupación_porque_tiene_datos_asociados	No se puede eliminar la agrupación porque tiene datos a solicitar asociados
requiere_cda	Control de acceso
considerar_todas	Considerar todas
cual_es_la_palabra_4_de_la_frase	¿Cuál es la cuarta palabra de la frase "{frase}"?
cual_es_la_palabra_5_de_la_frase	¿Cuál es la quinta palabra de la frase "{frase}"?
solicitar_otra_frase	Solicitar otra frase
consulte_al_administrador_de_bases_de_datos	Consulte al administrador de bases de datos
no_existe_el_origen_de_datos	No existe el origen de datos
la_sesion_ha_expirado	La sesión ha expirado
debe_volver_al_sitio_desde_donde_accedio_para_volver_a_comenzar	Debe volver al sitio desde el cual accedió para volver a comenzar
el_codigo_de_la_unidad_ejecutora_es_obligatorio	El código de la unidad ejecutora es obligatorio
solo_si_no_tiene_datos_asociados	Solo si no tiene datos asociados
no_se_puede_modifcar_un_dato_eliminado	No se puede modifcar un dato eliminado
mensajes_login_error	Error de inicio de sesión
el_campo_campo_solo_puede_contener_digitos	El campo {campo} solo puede contener dígitos
no_es_una_direccion_de_correo_electronico_valida	El valor ingresado no es una dirección de correo electrónico válida
el_valor_ingresado_no_es_aceptable	El valor ingresado no es aceptable
la_respuesta_a_la_pregunta_de_seguridad_no_es_correcta	La respuesta a la pregunta de seguridad no es correcta
olvido_su_contraseña	Si olvidó su contraseña póngase en contacto con soporte@agesic.com.uy
cupo_por_periodo	Cupo por período
el_cupo_por_periodo_es_obligatorio	El cupo por período es obligatorio
el_cupo_por_periodo_debe_ser_mayor_a_cero	El cupo por período debe ser mayor a cero
el_valor_es_obligatorio	El valor es obligatorio
no_se_encuentra_la_disponibilidad_especificada	No se encuentra la disponibilidad especificada
no_se_puede_modifcar_una_disponibilidad_eliminada	No se puede modifcar una disponibilidad dada de baja
el_cupo_debe_ser_mayor_o_igual_a_la_cantidad_de_reservas_existentes	El valor del cupo debe ser mayor o igual a la cantidad de reservas existentes
el_cupo_se_modifico_parcialmente_porque_hay_mas_reservas	El cupo se modificó parcialmente porque hay más reservas que el valor solicitado
para_diahora_el_cupo_se_modifico_parcialmente_porque_hay_mas_reservas	El cupo para {diahora} se modificó parcialmente porque hay más reservas que el valor solicitado
el_identificador_de_la_reserva_es_obligatorio	El identificador de la reserva es obligatorio
el_identificador_de_la_reserva_debe_ser_numerico	El identificador de la reserva debe ser numérico
cedula_de_identidad_invalida	La cédula de identidad ingresada no es válida
solo_se_puede_asignar_un_rol	Solo se puede asignar un rol al usuario en una empresa
configuracion_para_intranet	Configuración para intranet
dias_de_inicio_de_la_ventana_de_intranet_descripcion	Cantidad de días que existen entre la fecha de hoy y la fecha en la cual se puede comenzar a hacer reservas. Por ejemplo, se puede reservar a partir de dos días desde que se ingresó al sistema.
cantidad_de_dias_siguientes_disponibles	Cantidad de días siguientes disponibles para hacer una reserva
dias_de_inicio_de_la_ventana_de_internet_descripcion	Cantidad de días que existen entre la fecha de hoy y la fecha en la cual se puede comenzar a hacer reservas. Por ejemplo, se puede reservar a partir de dos días desde que se ingresó al sistema.
configuracion_del_llamador	Configuración del llamador
serie_asociada_a_los_numeros_de_reserva	Serie asociada a los números de reserva
confirmacion_de_datos	Confirmación de datos
el_tipo_de_documento_es_obligatorio	El tipo de documento es obligatorio
el_numero_de_documento_es_obligatorio	El número de documento es obligatorio
los_datos_ingresados_no_son_correctos	Los datos ingresados no son correctos
debe_haber_una_reserva_seleccionada	Debe haber una reserva seleccionada
tipo_de_documento	Tipo de documento
numero_de_documento	Número de documento
ir_a_la_busqueda_de_reservas	Ir a la búsqueda de reservas
el_estado_es_obligatorio	El estado es obligatorio
reporte_reservas	Reporte de reservas
reporte_asistencias	Reporte de asistencias
el_codigo_del_tramite_es_obligatorio	El código del trámite es obligatorio
lugar	lugar
lugares	lugares
datos_del_recurso	Datos generales
inicio_de_disponibilidad	Inicio de atención al público
fin_de_disponibilidad	Fin de atención al público
disponible_para_internet	Visible en internet
dias_de_la_ventana_de_internet	Duración de la ventana para agendar
largo_de_la_lista_de_espera	Número de filas en la lista de espera
con_trazabilidad	Integrar con trazabilidad
configuracion_para_internet	Configuración para internet
reporte_reserva_por_periodo_y_estado	Reporte de reserva por período y estado
el_codigo_de_seguridad_es_obligatorio	El código de cancelación es obligatorio
no_olvide_comunicarle_al_ciudadano_el_codigo_de_seguridad_de_la_reserva	No olvide comunicarle al ciudadano el código de cancelación de la reserva, ya que lo necesitará en caso de que decida cancelarla.
reporte_reservas_periodo	Reporte de reservas por período
ninguna	Ninguna
ninguno	Ninguno
reserva	Reserva
ha_ocurrido_un_error_grave	Ha ocurrido un error grave que no permite continuar con su solicitud
recurso_no_encontrado	Recurso no encontrado
el_recurso_solicitado_no_existe	El recurso solicitado no existe
verifique_la_direccion_especificada	Verifique que la dirección especificada sea correcta
error_no_solucionable	Error no solucionable
ha_ocurrido_un_error_no_solucionable	Ha ocurrido un error no solucionable
cerrar	Cerrar
seguimiento	Seguimiento del trámite
mostrar_numero_de_reserva_en_el_llamador	Visible en el llamador
mostrar_numero_de_reserva_en_el_ticket	Mostrar serie y número
debe_responder_la_pregunta_de_seguridad	Debe responder la pregunta de seguridad
publicar_novedades	Publicar en PDI
novedades	Novedades
dato_es	Este dato es
incluir	Incluir
aplicar_a	Aplicar a
sabado	Sábado
tipo_usuario	Tipo de usuario
rol	Rol
mapa_de_locacion	Mapa de locación
fechas_disponibles	Fechas disponibles
fecha_no_valida	La fecha especificada no es válida
ingreso_electronico	Ingreso electrónico
login_deshabilitado	Inicio de sesión deshabilitado
el_login_ha_sido_deshabilitado	El inicio de sesión local ha sido deshabilitado
debe_configurar_cda	Debe configurar la autenticación mediante CDA
ingreso_de_usuario	Ingreso de usuario
no_se_pudo_cargar_tramites	No se pudo cargar la lista de trámites
no_se_pudo_cargar_oficinas	No se pudo cargar la lista de oficinas
se_cargaron_n_oficinas	Se cargaron {cant} oficinas
se_cargaron_n_tramites	Se cargaron {cant} tramites
no_se_pudo_actualizar_lista_de_organismos	No se pudo actualizar la lista de organismos
no_se_pudo_actualizar_lista_de_unidades_ejecutoras	No se pudo actualizar la lista de unidades ejecutoras
lista_de_organismos_actualizada	La lista de organismos fue actualizada
lista_de_unidades_ejecutas_actualizada	La lista de unidades ejecutoras fue actualizada
no_hay_otro_superadmin	No hay otro superadministrador
no_se_pudo_determinar_si_hay_otro_superadministrador	No se pudo determinar si hay otro superadministrador
el_numero_de_puesto_no_es_valido	El número de puesto no es válido
exportar	Exportar
importar	Importar
importar_recurso	Importar recurso
archivo	Archivo
subir_archivo	Subir archivo
el_tamano_maximo_admitido_es_de_1mb	El archivo debe ser menor a 1 MB
no_se_pudo_cargar_el_archivo	No se pudo cargar el archivo
no_se_pudo_realizar_la_exportacion	No se pudo realizar la exportación
recurso_importado_exitosamente	Recusro importado exitosamente
archivo_cargado	Archivo cargado
gestionar_tokens	Gestionar tokens
token	Token
crear_token	Crear token
el_nombre_es_obligatorio	El nombre es obligatorio
el_correo_electronico_es_obligatorio	El correo electrónico es obligatorio
parametros_incorrectos	Parámetros incorrectos
esta_seguro_que_desea_eliminar_el_token	¿Esta seguro que desea eliminar el token?
modificar_empresa	Modificar empresa
modificar_usuario	Modificar usuario
modificar_agenda	Modificar agenda
modificar_recurso	Modificar recurso
gestionar_agrupaciones	Gestionar agrupaciones
realizar_reserva	Realizar reserva
seleccionar_agenda_recurso	Seleccionar agenda y recurso
inicio	Inicio
lista_de_llamadas	Lista de llamadas
reserva_por_id	Reserva por id
reserva_por_numero	Reserva por número
reserva_por_datos	Reserva por datos
mostrar_id_de_reserva_en_el_ticket	Mostrar identificador de la reserva
id_de_la_reserva	Identificador de la reserva
recargar_listado_de_organismos	Recargar organismos
recargar_listado_de_unidades_ejecutoras	Recargar unidades ejecutoras
recargar_listado_de_tramites	Recargar trámites
recargar_listado_de_oficinas	Recargar oficinas
el_codigo_del_usuario_es_obligatorio	La cédula de identidad del usuario es obligatoria
los_campos_indicados_con_asterisco_son_obligatorios	Los campos indicados con * son obligatorios
debe_cargar_un_archivo	Debe cargar un archivo
archivo_no_cargado	Archivo no cargado
puede_usar_las_siguientes_metavariables	Puede utilizar las siguientes metavariables
nombre_de_la_agenda_o_tramite	Nombre de la agenda o trámite
nombre_del_recurso_u_oficina	Nombre del recurso u oficina
direccion_fisica_donde_debe_concurrir	Dirección física donde debe concurrir el ciudadano
fecha_cuando_debe_concurrir	Fecha en la cual debe concurrir el ciudadano
hora_cuando_debe_concurrir	Hora en la cual debe concurrir el ciudadano
serie_asociada_al_recurso	Serie asociada al recurso
codigo_de_cancelacion_de_la_reserva	Código de cancelación de la reserva
codigo_de_trazabilidad_de_la_reserva	Código de trazabilidad de la reserva
enlace_a_la_pagina_de_cancelacion	Enlace a la página directa de cancelación de la reserva
identificador_de_la_reserva	Identificador de la reserva
puede_ingresar_codigo_html	Puede ingresar código HTML
\.


--
-- Data for Name: ae_tokens; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_tokens (token, empresa_id, nombre, email, fecha) FROM stdin;
\.


--
-- Data for Name: ae_tramites; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_tramites (id, empresa_id, nombre, quees, temas, online) FROM stdin;
\.


--
-- Data for Name: ae_trazabilidad; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_trazabilidad (transaccion_id, fecha_creacion, fecha_ult_intento, intentos, datos, enviado, id, es_cabezal, reserva_id, empresa_id, es_final) FROM stdin;
\.


--
-- Data for Name: ae_unidadesejecutoras; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_unidadesejecutoras (id, codigo, nombre) FROM stdin;
\.


--
-- Data for Name: ae_usuarios; Type: TABLE DATA; Schema: global; Owner: sae
--

COPY ae_usuarios (id, codigo, nombre, fecha_baja, password, correoe, superadmin) FROM stdin;
2	88888889	Administrador	\N		ialvarez@hg.com.uy	t
\.


--
-- Name: s_ae_empresa; Type: SEQUENCE SET; Schema: global; Owner: sae
--

SELECT pg_catalog.setval('s_ae_empresa', 2, true);


--
-- Name: s_ae_novedades; Type: SEQUENCE SET; Schema: global; Owner: sae
--

SELECT pg_catalog.setval('s_ae_novedades', 1, true);


--
-- Name: s_ae_trazabilidad; Type: SEQUENCE SET; Schema: global; Owner: sae
--

SELECT pg_catalog.setval('s_ae_trazabilidad', 1, true);


--
-- Name: s_ae_usuario; Type: SEQUENCE SET; Schema: global; Owner: sae
--

SELECT pg_catalog.setval('s_ae_usuario', 2, true);


SET search_path = empresa1, pg_catalog;

--
-- Name: ae_acciones_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_acciones
    ADD CONSTRAINT ae_acciones_pkey PRIMARY KEY (id);


--
-- Name: ae_acciones_por_dato_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_acciones_por_dato
    ADD CONSTRAINT ae_acciones_por_dato_pkey PRIMARY KEY (id);


--
-- Name: ae_acciones_por_recurso_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_acciones_por_recurso
    ADD CONSTRAINT ae_acciones_por_recurso_pkey PRIMARY KEY (id);


--
-- Name: ae_agendas_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_agendas
    ADD CONSTRAINT ae_agendas_pkey PRIMARY KEY (id);


--
-- Name: ae_agrupaciones_datos_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_agrupaciones_datos
    ADD CONSTRAINT ae_agrupaciones_datos_pkey PRIMARY KEY (id);


--
-- Name: ae_anios_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_anios
    ADD CONSTRAINT ae_anios_pkey PRIMARY KEY (id);


--
-- Name: ae_atencion_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_atencion
    ADD CONSTRAINT ae_atencion_pkey PRIMARY KEY (id);


--
-- Name: ae_captchas_pk; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_frases_captcha
    ADD CONSTRAINT ae_captchas_pk PRIMARY KEY (clave);


--
-- Name: ae_comunicaciones_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_comunicaciones
    ADD CONSTRAINT ae_comunicaciones_pkey PRIMARY KEY (id);


--
-- Name: ae_constante_validacion_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_constante_validacion
    ADD CONSTRAINT ae_constante_validacion_pkey PRIMARY KEY (id);


--
-- Name: ae_datos_a_solicitar_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_a_solicitar
    ADD CONSTRAINT ae_datos_a_solicitar_pkey PRIMARY KEY (id);


--
-- Name: ae_datos_del_recurso_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_del_recurso
    ADD CONSTRAINT ae_datos_del_recurso_pkey PRIMARY KEY (id);


--
-- Name: ae_datos_reserva_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_reserva
    ADD CONSTRAINT ae_datos_reserva_pkey PRIMARY KEY (id);


--
-- Name: ae_dias_del_mes_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_dias_del_mes
    ADD CONSTRAINT ae_dias_del_mes_pkey PRIMARY KEY (id);


--
-- Name: ae_dias_semana_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_dias_semana
    ADD CONSTRAINT ae_dias_semana_pkey PRIMARY KEY (id);


--
-- Name: ae_disponibilidades_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_disponibilidades
    ADD CONSTRAINT ae_disponibilidades_pkey PRIMARY KEY (id);


--
-- Name: ae_llamadas_aers_id_key; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_llamadas
    ADD CONSTRAINT ae_llamadas_aers_id_key UNIQUE (aers_id);


--
-- Name: ae_llamadas_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_llamadas
    ADD CONSTRAINT ae_llamadas_pkey PRIMARY KEY (id);


--
-- Name: ae_meses_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_meses
    ADD CONSTRAINT ae_meses_pkey PRIMARY KEY (id);


--
-- Name: ae_parametros_accion_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_parametros_accion
    ADD CONSTRAINT ae_parametros_accion_pkey PRIMARY KEY (id);


--
-- Name: ae_parametros_autocompletar_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_parametros_autocompletar
    ADD CONSTRAINT ae_parametros_autocompletar_pkey PRIMARY KEY (id);


--
-- Name: ae_parametros_validacion_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_parametros_validacion
    ADD CONSTRAINT ae_parametros_validacion_pkey PRIMARY KEY (id);


--
-- Name: ae_plantillas_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_plantillas
    ADD CONSTRAINT ae_plantillas_pkey PRIMARY KEY (id);


--
-- Name: ae_preguntas_pk; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_preguntas_captcha
    ADD CONSTRAINT ae_preguntas_pk PRIMARY KEY (clave);


--
-- Name: ae_recursos_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_recursos
    ADD CONSTRAINT ae_recursos_pkey PRIMARY KEY (id);


--
-- Name: ae_reservas_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_reservas
    ADD CONSTRAINT ae_reservas_pkey PRIMARY KEY (id);


--
-- Name: ae_serv_autocomp_por_dato_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_serv_autocomp_por_dato
    ADD CONSTRAINT ae_serv_autocomp_por_dato_pkey PRIMARY KEY (id);


--
-- Name: ae_serv_autocompletar_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_serv_autocompletar
    ADD CONSTRAINT ae_serv_autocompletar_pkey PRIMARY KEY (id);


--
-- Name: ae_servicio_por_recurso_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_servicio_por_recurso
    ADD CONSTRAINT ae_servicio_por_recurso_pkey PRIMARY KEY (id);


--
-- Name: ae_textos_agenda_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_textos_agenda
    ADD CONSTRAINT ae_textos_agenda_pkey PRIMARY KEY (id);


--
-- Name: ae_textos_pk; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_textos
    ADD CONSTRAINT ae_textos_pk PRIMARY KEY (codigo, idioma);


--
-- Name: ae_textos_recurso_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_textos_recurso
    ADD CONSTRAINT ae_textos_recurso_pkey PRIMARY KEY (id);


--
-- Name: ae_validaciones_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_validaciones
    ADD CONSTRAINT ae_validaciones_pkey PRIMARY KEY (id);


--
-- Name: ae_validaciones_por_dato_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_validaciones_por_dato
    ADD CONSTRAINT ae_validaciones_por_dato_pkey PRIMARY KEY (id);


--
-- Name: ae_validaciones_por_recurso_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_validaciones_por_recurso
    ADD CONSTRAINT ae_validaciones_por_recurso_pkey PRIMARY KEY (id);


--
-- Name: ae_valor_constante_val_rec_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_valor_constante_val_rec
    ADD CONSTRAINT ae_valor_constante_val_rec_pkey PRIMARY KEY (id);


--
-- Name: ae_valores_del_dato_pkey; Type: CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_valores_del_dato
    ADD CONSTRAINT ae_valores_del_dato_pkey PRIMARY KEY (id);


SET search_path = global, pg_catalog;

--
-- Name: ae_captchas_pk; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_captchas
    ADD CONSTRAINT ae_captchas_pk PRIMARY KEY (clave);


--
-- Name: ae_configuracion_pk; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_configuracion
    ADD CONSTRAINT ae_configuracion_pk PRIMARY KEY (clave);


--
-- Name: ae_empresas_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_empresas
    ADD CONSTRAINT ae_empresas_pkey PRIMARY KEY (id);


--
-- Name: ae_novedades_pk; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_novedades
    ADD CONSTRAINT ae_novedades_pk PRIMARY KEY (id);


--
-- Name: ae_oficinas_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_oficinas
    ADD CONSTRAINT ae_oficinas_pkey PRIMARY KEY (id);


--
-- Name: ae_oficinas_un1; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_oficinas
    ADD CONSTRAINT ae_oficinas_un1 UNIQUE (tramite_id, nombre);


--
-- Name: ae_organismos_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_organismos
    ADD CONSTRAINT ae_organismos_pkey PRIMARY KEY (id);


--
-- Name: ae_organismos_un1; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_organismos
    ADD CONSTRAINT ae_organismos_un1 UNIQUE (codigo);


--
-- Name: ae_rel_usuarios_empresas_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_rel_usuarios_empresas
    ADD CONSTRAINT ae_rel_usuarios_empresas_pkey PRIMARY KEY (usuario_id, empresa_id);


--
-- Name: ae_rel_usuarios_roles_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_rel_usuarios_roles
    ADD CONSTRAINT ae_rel_usuarios_roles_pkey PRIMARY KEY (usuario_id, empresa_id, rol_nombre);


--
-- Name: ae_textos_pk; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_textos
    ADD CONSTRAINT ae_textos_pk PRIMARY KEY (codigo);


--
-- Name: ae_tokens_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_tokens
    ADD CONSTRAINT ae_tokens_pkey PRIMARY KEY (token);


--
-- Name: ae_tramites_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_tramites
    ADD CONSTRAINT ae_tramites_pkey PRIMARY KEY (id);


--
-- Name: ae_trazabilidad_pk; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_trazabilidad
    ADD CONSTRAINT ae_trazabilidad_pk PRIMARY KEY (id);


--
-- Name: ae_unidadesejecutoras_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_unidadesejecutoras
    ADD CONSTRAINT ae_unidadesejecutoras_pkey PRIMARY KEY (id);


--
-- Name: ae_unidadesejecutoras_un1; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_unidadesejecutoras
    ADD CONSTRAINT ae_unidadesejecutoras_un1 UNIQUE (codigo);


--
-- Name: ae_usuarios_pkey; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_usuarios
    ADD CONSTRAINT ae_usuarios_pkey PRIMARY KEY (id);


--
-- Name: ae_usuarios_un1; Type: CONSTRAINT; Schema: global; Owner: sae
--

ALTER TABLE ONLY ae_usuarios
    ADD CONSTRAINT ae_usuarios_un1 UNIQUE (codigo);


SET search_path = empresa1, pg_catalog;

--
-- Name: fk1c09bf24104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_disponibilidades
    ADD CONSTRAINT fk1c09bf24104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fk1c09bf249a9bb7b2; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_disponibilidades
    ADD CONSTRAINT fk1c09bf249a9bb7b2 FOREIGN KEY (aepl_id) REFERENCES ae_plantillas(id);


--
-- Name: fk28a15dc69a9bb7b2; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_dias_semana
    ADD CONSTRAINT fk28a15dc69a9bb7b2 FOREIGN KEY (aepl_id) REFERENCES ae_plantillas(id);


--
-- Name: fk3360aa44104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_agrupaciones_datos
    ADD CONSTRAINT fk3360aa44104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fk3ce7cc09104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_a_solicitar
    ADD CONSTRAINT fk3ce7cc09104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fk3ce7cc091876ae95; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_a_solicitar
    ADD CONSTRAINT fk3ce7cc091876ae95 FOREIGN KEY (aead_id) REFERENCES ae_agrupaciones_datos(id);


--
-- Name: fk3e0b63a4cc9035ed; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_parametros_autocompletar
    ADD CONSTRAINT fk3e0b63a4cc9035ed FOREIGN KEY (aeserv_id) REFERENCES ae_serv_autocompletar(id);


--
-- Name: fk3f09314323ebf200; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_constante_validacion
    ADD CONSTRAINT fk3f09314323ebf200 FOREIGN KEY (aeva_id) REFERENCES ae_validaciones(id);


--
-- Name: fk42202b5436760caf; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_valores_del_dato
    ADD CONSTRAINT fk42202b5436760caf FOREIGN KEY (aeds_id) REFERENCES ae_datos_a_solicitar(id);


--
-- Name: fk4da30a11e4b40066; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_parametros_accion
    ADD CONSTRAINT fk4da30a11e4b40066 FOREIGN KEY (aeac_id) REFERENCES ae_acciones(id);


--
-- Name: fk5ff42436104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_del_recurso
    ADD CONSTRAINT fk5ff42436104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fk66d0a85036760caf; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_validaciones_por_dato
    ADD CONSTRAINT fk66d0a85036760caf FOREIGN KEY (aeds_id) REFERENCES ae_datos_a_solicitar(id);


--
-- Name: fk66d0a8508d2f46a5; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_validaciones_por_dato
    ADD CONSTRAINT fk66d0a8508d2f46a5 FOREIGN KEY (aevr_id) REFERENCES ae_validaciones_por_recurso(id);


--
-- Name: fk6e5144f336760caf; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_acciones_por_dato
    ADD CONSTRAINT fk6e5144f336760caf FOREIGN KEY (aeds_id) REFERENCES ae_datos_a_solicitar(id);


--
-- Name: fk6e5144f362f9440d; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_acciones_por_dato
    ADD CONSTRAINT fk6e5144f362f9440d FOREIGN KEY (aear_id) REFERENCES ae_acciones_por_recurso(id);


--
-- Name: fk79b9a11211242882; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_reservas_disponibilidades
    ADD CONSTRAINT fk79b9a11211242882 FOREIGN KEY (aers_id) REFERENCES ae_reservas(id);


--
-- Name: fk79b9a112406004b7; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_reservas_disponibilidades
    ADD CONSTRAINT fk79b9a112406004b7 FOREIGN KEY (aedi_id) REFERENCES ae_disponibilidades(id);


--
-- Name: fk8a30e71e8d2f46a5; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_valor_constante_val_rec
    ADD CONSTRAINT fk8a30e71e8d2f46a5 FOREIGN KEY (aevr_id) REFERENCES ae_validaciones_por_recurso(id);


--
-- Name: fk96b86f5fe4ef2a07; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_textos_agenda
    ADD CONSTRAINT fk96b86f5fe4ef2a07 FOREIGN KEY (aeag_id) REFERENCES ae_agendas(id);


--
-- Name: fk9e323ab1104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_validaciones_por_recurso
    ADD CONSTRAINT fk9e323ab1104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fk9e323ab123ebf200; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_validaciones_por_recurso
    ADD CONSTRAINT fk9e323ab123ebf200 FOREIGN KEY (aeva_id) REFERENCES ae_validaciones(id);


--
-- Name: fk9ecc9f5911242882; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_reserva
    ADD CONSTRAINT fk9ecc9f5911242882 FOREIGN KEY (aers_id) REFERENCES ae_reservas(id);


--
-- Name: fk9ecc9f5936760caf; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_datos_reserva
    ADD CONSTRAINT fk9ecc9f5936760caf FOREIGN KEY (aeds_id) REFERENCES ae_datos_a_solicitar(id);


--
-- Name: fka0da2cfc104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_llamadas
    ADD CONSTRAINT fka0da2cfc104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fka0da2cfc11242882; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_llamadas
    ADD CONSTRAINT fka0da2cfc11242882 FOREIGN KEY (aers_id) REFERENCES ae_reservas(id);


--
-- Name: fka1b7fd05e4ef2a07; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_recursos
    ADD CONSTRAINT fka1b7fd05e4ef2a07 FOREIGN KEY (aeag_id) REFERENCES ae_agendas(id);


--
-- Name: fkacfc169736760caf; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_serv_autocomp_por_dato
    ADD CONSTRAINT fkacfc169736760caf FOREIGN KEY (aeds_id) REFERENCES ae_datos_a_solicitar(id);


--
-- Name: fkacfc1697bcb2c28e; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_serv_autocomp_por_dato
    ADD CONSTRAINT fkacfc1697bcb2c28e FOREIGN KEY (aesr_id) REFERENCES ae_servicio_por_recurso(id);


--
-- Name: fkade6372e104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_acciones_por_recurso
    ADD CONSTRAINT fkade6372e104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fkade6372ee4b40066; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_acciones_por_recurso
    ADD CONSTRAINT fkade6372ee4b40066 FOREIGN KEY (aeac_id) REFERENCES ae_acciones(id);


--
-- Name: fkc717af5423ebf200; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_parametros_validacion
    ADD CONSTRAINT fkc717af5423ebf200 FOREIGN KEY (aeva_id) REFERENCES ae_validaciones(id);


--
-- Name: fkd1fddf1a9a9bb7b2; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_dias_del_mes
    ADD CONSTRAINT fkd1fddf1a9a9bb7b2 FOREIGN KEY (aepl_id) REFERENCES ae_plantillas(id);


--
-- Name: fkd75adbaf104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_servicio_por_recurso
    ADD CONSTRAINT fkd75adbaf104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: fkd75adbafcc9035ed; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_servicio_por_recurso
    ADD CONSTRAINT fkd75adbafcc9035ed FOREIGN KEY (aeserv_id) REFERENCES ae_serv_autocompletar(id);


--
-- Name: fkd841909c11242882; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_atencion
    ADD CONSTRAINT fkd841909c11242882 FOREIGN KEY (aers_id) REFERENCES ae_reservas(id);


--
-- Name: fke2ce44e59a9bb7b2; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_anios
    ADD CONSTRAINT fke2ce44e59a9bb7b2 FOREIGN KEY (aepl_id) REFERENCES ae_plantillas(id);


--
-- Name: fke3736bee9a9bb7b2; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_meses
    ADD CONSTRAINT fke3736bee9a9bb7b2 FOREIGN KEY (aepl_id) REFERENCES ae_plantillas(id);


--
-- Name: fkf9c6590b104398e1; Type: FK CONSTRAINT; Schema: empresa1; Owner: sae
--

ALTER TABLE ONLY ae_plantillas
    ADD CONSTRAINT fkf9c6590b104398e1 FOREIGN KEY (aere_id) REFERENCES ae_recursos(id);


--
-- Name: empresa1; Type: ACL; Schema: -; Owner: sae
--

REVOKE ALL ON SCHEMA empresa1 FROM PUBLIC;
REVOKE ALL ON SCHEMA empresa1 FROM sae;
GRANT ALL ON SCHEMA empresa1 TO sae;
GRANT ALL ON SCHEMA empresa1 TO postgres;
GRANT ALL ON SCHEMA empresa1 TO PUBLIC;


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

