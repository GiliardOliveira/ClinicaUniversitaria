PGDMP     7            
        w         
   hospitalDB    11.5    11.5 ,    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            D           1262    16393 
   hospitalDB    DATABASE     �   CREATE DATABASE "hospitalDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE "hospitalDB";
             postgres    false            E           0    0    DATABASE "hospitalDB"    COMMENT     ~   COMMENT ON DATABASE "hospitalDB" IS 'Esse banco de dados é unicamente utilizado para cadastro e retorno de exames médicos';
                  postgres    false    2884            �            1259    16431    tb_cid10    TABLE     ,  CREATE TABLE public.tb_cid10 (
    cid character varying(4) NOT NULL,
    classif "char",
    restrsexo "char",
    causaobto "char",
    decricao character varying(300) NOT NULL,
    descrabrev character varying(150) NOT NULL,
    refer character varying(40),
    excluidos character varying(14)
);
    DROP TABLE public.tb_cid10;
       public         postgres    false            �            1259    16414    tb_docentes    TABLE     �   CREATE TABLE public.tb_docentes (
    crm_medico character varying(13) NOT NULL,
    titulacao character varying(20) NOT NULL
);
    DROP TABLE public.tb_docentes;
       public         postgres    false            �            1259    16457 	   tb_exames    TABLE     �   CREATE TABLE public.tb_exames (
    id integer NOT NULL,
    crm_med_resid character varying(13) NOT NULL,
    link_pdf character varying(350),
    data_hora date NOT NULL,
    id_pedido_exame integer NOT NULL
);
    DROP TABLE public.tb_exames;
       public         postgres    false            �            1259    16485    tb_laudo_status    TABLE     �   CREATE TABLE public.tb_laudo_status (
    id_exame_laudo integer NOT NULL,
    status boolean DEFAULT false NOT NULL,
    crm_med_doc character varying(13) NOT NULL
);
 #   DROP TABLE public.tb_laudo_status;
       public         postgres    false            F           0    0 "   COLUMN tb_laudo_status.crm_med_doc    COMMENT     R   COMMENT ON COLUMN public.tb_laudo_status.crm_med_doc IS 'CRM do médico docente';
            public       postgres    false    205            �            1259    16467 	   tb_laudos    TABLE     �   CREATE TABLE public.tb_laudos (
    id_exame integer NOT NULL,
    crm_med_resid character varying(13) NOT NULL,
    descricao text NOT NULL,
    conclusao text NOT NULL
);
    DROP TABLE public.tb_laudos;
       public         postgres    false            �            1259    16394 
   tb_medicos    TABLE     u   CREATE TABLE public.tb_medicos (
    crm character varying(13) NOT NULL,
    nome character varying(150) NOT NULL
);
    DROP TABLE public.tb_medicos;
       public         postgres    false            �            1259    16426    tb_pacientes    TABLE     �   CREATE TABLE public.tb_pacientes (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    sexo "char" NOT NULL,
    cor character varying(25),
    dt_nasc date NOT NULL
);
     DROP TABLE public.tb_pacientes;
       public         postgres    false            �            1259    16424    tb_pacientes_id_seq    SEQUENCE     �   ALTER TABLE public.tb_pacientes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_pacientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    200            �            1259    16439    tb_pedido_exames    TABLE     (  CREATE TABLE public.tb_pedido_exames (
    id integer NOT NULL,
    crm_medico character varying(13) NOT NULL,
    nome_exame character varying(35) NOT NULL,
    data_prevista date NOT NULL,
    hipotese_diag_cid character varying(4) NOT NULL,
    recomendacao character varying(650) NOT NULL
);
 $   DROP TABLE public.tb_pedido_exames;
       public         postgres    false            �            1259    16404    tb_residentes    TABLE     s   CREATE TABLE public.tb_residentes (
    crm_medico character varying(13) NOT NULL,
    ano_inicio date NOT NULL
);
 !   DROP TABLE public.tb_residentes;
       public         postgres    false            :          0    16431    tb_cid10 
   TABLE DATA               n   COPY public.tb_cid10 (cid, classif, restrsexo, causaobto, decricao, descrabrev, refer, excluidos) FROM stdin;
    public       postgres    false    201   �5       7          0    16414    tb_docentes 
   TABLE DATA               <   COPY public.tb_docentes (crm_medico, titulacao) FROM stdin;
    public       postgres    false    198   �5       <          0    16457 	   tb_exames 
   TABLE DATA               \   COPY public.tb_exames (id, crm_med_resid, link_pdf, data_hora, id_pedido_exame) FROM stdin;
    public       postgres    false    203   6       >          0    16485    tb_laudo_status 
   TABLE DATA               N   COPY public.tb_laudo_status (id_exame_laudo, status, crm_med_doc) FROM stdin;
    public       postgres    false    205   66       =          0    16467 	   tb_laudos 
   TABLE DATA               R   COPY public.tb_laudos (id_exame, crm_med_resid, descricao, conclusao) FROM stdin;
    public       postgres    false    204   S6       5          0    16394 
   tb_medicos 
   TABLE DATA               /   COPY public.tb_medicos (crm, nome) FROM stdin;
    public       postgres    false    196   p6       9          0    16426    tb_pacientes 
   TABLE DATA               D   COPY public.tb_pacientes (id, nome, sexo, cor, dt_nasc) FROM stdin;
    public       postgres    false    200   �6       ;          0    16439    tb_pedido_exames 
   TABLE DATA               v   COPY public.tb_pedido_exames (id, crm_medico, nome_exame, data_prevista, hipotese_diag_cid, recomendacao) FROM stdin;
    public       postgres    false    202   �6       6          0    16404    tb_residentes 
   TABLE DATA               ?   COPY public.tb_residentes (crm_medico, ano_inicio) FROM stdin;
    public       postgres    false    197   �6       G           0    0    tb_pacientes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tb_pacientes_id_seq', 1, false);
            public       postgres    false    199            �
           2606    16400    tb_medicos crm 
   CONSTRAINT     M   ALTER TABLE ONLY public.tb_medicos
    ADD CONSTRAINT crm PRIMARY KEY (crm);
 8   ALTER TABLE ONLY public.tb_medicos DROP CONSTRAINT crm;
       public         postgres    false    196            �
           2606    16438    tb_cid10 tb_cid10_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tb_cid10
    ADD CONSTRAINT tb_cid10_pkey PRIMARY KEY (cid);
 @   ALTER TABLE ONLY public.tb_cid10 DROP CONSTRAINT tb_cid10_pkey;
       public         postgres    false    201            �
           2606    16418    tb_docentes tb_docentes_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tb_docentes
    ADD CONSTRAINT tb_docentes_pkey PRIMARY KEY (crm_medico);
 F   ALTER TABLE ONLY public.tb_docentes DROP CONSTRAINT tb_docentes_pkey;
       public         postgres    false    198            �
           2606    16461    tb_exames tb_exames_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tb_exames
    ADD CONSTRAINT tb_exames_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tb_exames DROP CONSTRAINT tb_exames_pkey;
       public         postgres    false    203            �
           2606    16490 $   tb_laudo_status tb_laudo_status_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.tb_laudo_status
    ADD CONSTRAINT tb_laudo_status_pkey PRIMARY KEY (id_exame_laudo);
 N   ALTER TABLE ONLY public.tb_laudo_status DROP CONSTRAINT tb_laudo_status_pkey;
       public         postgres    false    205            �
           2606    16474    tb_laudos tb_laudos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tb_laudos
    ADD CONSTRAINT tb_laudos_pkey PRIMARY KEY (id_exame);
 B   ALTER TABLE ONLY public.tb_laudos DROP CONSTRAINT tb_laudos_pkey;
       public         postgres    false    204            �
           2606    16430    tb_pacientes tb_pacientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tb_pacientes
    ADD CONSTRAINT tb_pacientes_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tb_pacientes DROP CONSTRAINT tb_pacientes_pkey;
       public         postgres    false    200            �
           2606    16446 &   tb_pedido_exames tb_pedido_exames_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tb_pedido_exames
    ADD CONSTRAINT tb_pedido_exames_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tb_pedido_exames DROP CONSTRAINT tb_pedido_exames_pkey;
       public         postgres    false    202            �
           2606    16408     tb_residentes tb_residentes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tb_residentes
    ADD CONSTRAINT tb_residentes_pkey PRIMARY KEY (crm_medico);
 J   ALTER TABLE ONLY public.tb_residentes DROP CONSTRAINT tb_residentes_pkey;
       public         postgres    false    197            �
           2606    16419 '   tb_docentes tb_docentes_crm_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_docentes
    ADD CONSTRAINT tb_docentes_crm_medico_fkey FOREIGN KEY (crm_medico) REFERENCES public.tb_medicos(crm);
 Q   ALTER TABLE ONLY public.tb_docentes DROP CONSTRAINT tb_docentes_crm_medico_fkey;
       public       postgres    false    2722    196    198            �
           2606    16462 &   tb_exames tb_exames_crm_med_resid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_exames
    ADD CONSTRAINT tb_exames_crm_med_resid_fkey FOREIGN KEY (crm_med_resid) REFERENCES public.tb_residentes(crm_medico);
 P   ALTER TABLE ONLY public.tb_exames DROP CONSTRAINT tb_exames_crm_med_resid_fkey;
       public       postgres    false    2724    197    203            �
           2606    16496 0   tb_laudo_status tb_laudo_status_crm_med_doc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_laudo_status
    ADD CONSTRAINT tb_laudo_status_crm_med_doc_fkey FOREIGN KEY (crm_med_doc) REFERENCES public.tb_docentes(crm_medico);
 Z   ALTER TABLE ONLY public.tb_laudo_status DROP CONSTRAINT tb_laudo_status_crm_med_doc_fkey;
       public       postgres    false    2726    205    198            �
           2606    16491 3   tb_laudo_status tb_laudo_status_id_exame_laudo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_laudo_status
    ADD CONSTRAINT tb_laudo_status_id_exame_laudo_fkey FOREIGN KEY (id_exame_laudo) REFERENCES public.tb_laudos(id_exame);
 ]   ALTER TABLE ONLY public.tb_laudo_status DROP CONSTRAINT tb_laudo_status_id_exame_laudo_fkey;
       public       postgres    false    2736    205    204            �
           2606    16480 &   tb_laudos tb_laudos_crm_med_resid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_laudos
    ADD CONSTRAINT tb_laudos_crm_med_resid_fkey FOREIGN KEY (crm_med_resid) REFERENCES public.tb_residentes(crm_medico);
 P   ALTER TABLE ONLY public.tb_laudos DROP CONSTRAINT tb_laudos_crm_med_resid_fkey;
       public       postgres    false    197    204    2724            �
           2606    16475 !   tb_laudos tb_laudos_id_exame_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_laudos
    ADD CONSTRAINT tb_laudos_id_exame_fkey FOREIGN KEY (id_exame) REFERENCES public.tb_exames(id);
 K   ALTER TABLE ONLY public.tb_laudos DROP CONSTRAINT tb_laudos_id_exame_fkey;
       public       postgres    false    204    203    2734            �
           2606    16447 1   tb_pedido_exames tb_pedido_exames_crm_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_pedido_exames
    ADD CONSTRAINT tb_pedido_exames_crm_medico_fkey FOREIGN KEY (crm_medico) REFERENCES public.tb_medicos(crm);
 [   ALTER TABLE ONLY public.tb_pedido_exames DROP CONSTRAINT tb_pedido_exames_crm_medico_fkey;
       public       postgres    false    2722    196    202            �
           2606    16452 8   tb_pedido_exames tb_pedido_exames_hipotese_diag_cid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_pedido_exames
    ADD CONSTRAINT tb_pedido_exames_hipotese_diag_cid_fkey FOREIGN KEY (hipotese_diag_cid) REFERENCES public.tb_cid10(cid);
 b   ALTER TABLE ONLY public.tb_pedido_exames DROP CONSTRAINT tb_pedido_exames_hipotese_diag_cid_fkey;
       public       postgres    false    201    202    2730            �
           2606    16409 +   tb_residentes tb_residentes_crm_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_residentes
    ADD CONSTRAINT tb_residentes_crm_medico_fkey FOREIGN KEY (crm_medico) REFERENCES public.tb_medicos(crm);
 U   ALTER TABLE ONLY public.tb_residentes DROP CONSTRAINT tb_residentes_crm_medico_fkey;
       public       postgres    false    2722    197    196            :      x������ � �      7      x������ � �      <      x������ � �      >      x������ � �      =      x������ � �      5      x������ � �      9      x������ � �      ;      x������ � �      6      x������ � �     