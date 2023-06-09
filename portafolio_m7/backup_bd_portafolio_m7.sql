PGDMP         "                {           portafolio_m7    15.1    15.1 7    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    49250    portafolio_m7    DATABASE     �   CREATE DATABASE portafolio_m7 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE portafolio_m7;
                postgres    false            �            1259    49304    Carros    TABLE     �   CREATE TABLE public."Carros" (
    id integer NOT NULL,
    "idUsuario" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Carros";
       public         heap    postgres    false            �            1259    49303    Carros_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Carros_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Carros_id_seq";
       public          postgres    false    228            A           0    0    Carros_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Carros_id_seq" OWNED BY public."Carros".id;
          public          postgres    false    227            �            1259    49316    DetalleCarros    TABLE     	  CREATE TABLE public."DetalleCarros" (
    id integer NOT NULL,
    "idCarro" integer NOT NULL,
    "idProducto" integer NOT NULL,
    cantidad integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."DetalleCarros";
       public         heap    postgres    false            �            1259    49315    DetalleCarros_id_seq    SEQUENCE     �   CREATE SEQUENCE public."DetalleCarros_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."DetalleCarros_id_seq";
       public          postgres    false    230            B           0    0    DetalleCarros_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."DetalleCarros_id_seq" OWNED BY public."DetalleCarros".id;
          public          postgres    false    229            �            1259    49266 	   Productos    TABLE     �  CREATE TABLE public."Productos" (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    marca character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    stock integer NOT NULL,
    precio integer NOT NULL,
    imagen1 character varying(255) NOT NULL,
    imagen2 character varying(255) NOT NULL,
    imagen3 character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Productos";
       public         heap    postgres    false            �            1259    49265    Productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Productos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Productos_id_seq";
       public          postgres    false    222            C           0    0    Productos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Productos_id_seq" OWNED BY public."Productos".id;
          public          postgres    false    221            �            1259    49251    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            �            1259    49257    Usuarios    TABLE     �  CREATE TABLE public."Usuarios" (
    id integer NOT NULL,
    alias character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Usuarios";
       public         heap    postgres    false            �            1259    49256    Usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Usuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Usuarios_id_seq";
       public          postgres    false    220            D           0    0    Usuarios_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Usuarios_id_seq" OWNED BY public."Usuarios".id;
          public          postgres    false    219            �            1259    49275    Venta    TABLE     $  CREATE TABLE public."Venta" (
    id integer NOT NULL,
    "idUsuario" integer NOT NULL,
    subtotal integer NOT NULL,
    descuento integer NOT NULL,
    "precioTotal" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Venta";
       public         heap    postgres    false            �            1259    49274    Venta_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Venta_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Venta_id_seq";
       public          postgres    false    224            E           0    0    Venta_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Venta_id_seq" OWNED BY public."Venta".id;
          public          postgres    false    223            �            1259    49287    detalleVenta    TABLE       CREATE TABLE public."detalleVenta" (
    id integer NOT NULL,
    "idVenta" integer,
    "idProducto" integer,
    cantidad integer NOT NULL,
    "precioUnitario" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."detalleVenta";
       public         heap    postgres    false            �            1259    49286    detalleVenta_id_seq    SEQUENCE     �   CREATE SEQUENCE public."detalleVenta_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."detalleVenta_id_seq";
       public          postgres    false    226            F           0    0    detalleVenta_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."detalleVenta_id_seq" OWNED BY public."detalleVenta".id;
          public          postgres    false    225            �           2604    49307 	   Carros id    DEFAULT     j   ALTER TABLE ONLY public."Carros" ALTER COLUMN id SET DEFAULT nextval('public."Carros_id_seq"'::regclass);
 :   ALTER TABLE public."Carros" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    49319    DetalleCarros id    DEFAULT     x   ALTER TABLE ONLY public."DetalleCarros" ALTER COLUMN id SET DEFAULT nextval('public."DetalleCarros_id_seq"'::regclass);
 A   ALTER TABLE public."DetalleCarros" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    49269    Productos id    DEFAULT     p   ALTER TABLE ONLY public."Productos" ALTER COLUMN id SET DEFAULT nextval('public."Productos_id_seq"'::regclass);
 =   ALTER TABLE public."Productos" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    49260    Usuarios id    DEFAULT     n   ALTER TABLE ONLY public."Usuarios" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_id_seq"'::regclass);
 <   ALTER TABLE public."Usuarios" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    49278    Venta id    DEFAULT     h   ALTER TABLE ONLY public."Venta" ALTER COLUMN id SET DEFAULT nextval('public."Venta_id_seq"'::regclass);
 9   ALTER TABLE public."Venta" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    49290    detalleVenta id    DEFAULT     v   ALTER TABLE ONLY public."detalleVenta" ALTER COLUMN id SET DEFAULT nextval('public."detalleVenta_id_seq"'::regclass);
 @   ALTER TABLE public."detalleVenta" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            8          0    49304    Carros 
   TABLE DATA           M   COPY public."Carros" (id, "idUsuario", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    228   VC       :          0    49316    DetalleCarros 
   TABLE DATA           j   COPY public."DetalleCarros" (id, "idCarro", "idProducto", cantidad, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    230   �C       2          0    49266 	   Productos 
   TABLE DATA           �   COPY public."Productos" (id, nombre, marca, descripcion, stock, precio, imagen1, imagen2, imagen3, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    222   �C       .          0    49251    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    218   �H       0          0    49257    Usuarios 
   TABLE DATA           l   COPY public."Usuarios" (id, alias, nombre, apellido, email, password, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   (I       4          0    49275    Venta 
   TABLE DATA           p   COPY public."Venta" (id, "idUsuario", subtotal, descuento, "precioTotal", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    224   �I       6          0    49287    detalleVenta 
   TABLE DATA           {   COPY public."detalleVenta" (id, "idVenta", "idProducto", cantidad, "precioUnitario", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    226   /J       G           0    0    Carros_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Carros_id_seq"', 9, true);
          public          postgres    false    227            H           0    0    DetalleCarros_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."DetalleCarros_id_seq"', 34, true);
          public          postgres    false    229            I           0    0    Productos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Productos_id_seq"', 12, true);
          public          postgres    false    221            J           0    0    Usuarios_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Usuarios_id_seq"', 4, true);
          public          postgres    false    219            K           0    0    Venta_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Venta_id_seq"', 4, true);
          public          postgres    false    223            L           0    0    detalleVenta_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."detalleVenta_id_seq"', 7, true);
          public          postgres    false    225            �           2606    49309    Carros Carros_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Carros"
    ADD CONSTRAINT "Carros_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Carros" DROP CONSTRAINT "Carros_pkey";
       public            postgres    false    228            �           2606    49321     DetalleCarros DetalleCarros_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."DetalleCarros"
    ADD CONSTRAINT "DetalleCarros_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."DetalleCarros" DROP CONSTRAINT "DetalleCarros_pkey";
       public            postgres    false    230            �           2606    49273    Productos Productos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Productos"
    ADD CONSTRAINT "Productos_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Productos" DROP CONSTRAINT "Productos_pkey";
       public            postgres    false    222            �           2606    49255     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    218            �           2606    49264    Usuarios Usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Usuarios" DROP CONSTRAINT "Usuarios_pkey";
       public            postgres    false    220            �           2606    49280    Venta Venta_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Venta"
    ADD CONSTRAINT "Venta_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Venta" DROP CONSTRAINT "Venta_pkey";
       public            postgres    false    224            �           2606    49292    detalleVenta detalleVenta_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."detalleVenta"
    ADD CONSTRAINT "detalleVenta_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."detalleVenta" DROP CONSTRAINT "detalleVenta_pkey";
       public            postgres    false    226            �           2606    49310    Carros Carros_idUsuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Carros"
    ADD CONSTRAINT "Carros_idUsuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Carros" DROP CONSTRAINT "Carros_idUsuario_fkey";
       public          postgres    false    3215    228    220            �           2606    49322 (   DetalleCarros DetalleCarros_idCarro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DetalleCarros"
    ADD CONSTRAINT "DetalleCarros_idCarro_fkey" FOREIGN KEY ("idCarro") REFERENCES public."Carros"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."DetalleCarros" DROP CONSTRAINT "DetalleCarros_idCarro_fkey";
       public          postgres    false    230    228    3223            �           2606    49327 +   DetalleCarros DetalleCarros_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DetalleCarros"
    ADD CONSTRAINT "DetalleCarros_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public."Productos"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public."DetalleCarros" DROP CONSTRAINT "DetalleCarros_idProducto_fkey";
       public          postgres    false    222    230    3217            �           2606    49281    Venta Venta_idUsuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Venta"
    ADD CONSTRAINT "Venta_idUsuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES public."Usuarios"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public."Venta" DROP CONSTRAINT "Venta_idUsuario_fkey";
       public          postgres    false    220    3215    224            �           2606    49298 )   detalleVenta detalleVenta_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detalleVenta"
    ADD CONSTRAINT "detalleVenta_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public."Productos"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public."detalleVenta" DROP CONSTRAINT "detalleVenta_idProducto_fkey";
       public          postgres    false    222    226    3217            �           2606    49293 &   detalleVenta detalleVenta_idVenta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detalleVenta"
    ADD CONSTRAINT "detalleVenta_idVenta_fkey" FOREIGN KEY ("idVenta") REFERENCES public."Venta"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."detalleVenta" DROP CONSTRAINT "detalleVenta_idVenta_fkey";
       public          postgres    false    3219    226    224            8   -   x���4�4202�50�52W00�2��21�36�
������ p�e      :   T   x�}���0F�s��J���,�?��bb�x}/��bE���
��!Hق�O�YL;���-�M޿\5��_���b"�5k"�      2   �  x��V�n�F>�O1`���,���J�F�.����"���]vI*��&�zɥ���:��m)I�4l`g8���7�
�E<�a�d��Y��"�bX$���z0�p�%�(��a��Y0��b�����3x����2,�,�JB��FA,ڒK�`4� ׉���y�SQ�U�u�
���jc=��)�����>x�������>����$t�x��E���.�t� ^���=�^c�{ox�ߠĦAgB��F�X�jV(s�h�ə��|���P�B?|���\��i@�V9�

4Ǣ�s��Q��f��	�)���e�����8���a�I�e�m�g�nMR	-q�5�q���þgx|*֭���
��К?�f伈���_�CY؎ǳ��d����f/���ؙ��A![�U���P��\:X�TV2��L�.oQ6��k��<gd�WϩUv9���(-��i%�6�QP�g9��d����5'��٢�d��][0�B~���5����(M^��t� r��h�9k�޲���js�	��Qm�y�f�Χ��2�פV"o�U�N��@�L�a��$ՒlU� -xΕd�
��@�.P�B��Y���p��ɷhc�^���_�^��Q�u��,��j#�7�2ݖ�@�j�9~4�z�WT�ʷ\ث��*~�L�������v୒��4K�l�H��Y��	��=�1����?Kf�B"�P¯-s�U��X�ǘ՝$I��R�i%�a�#|Î���v��Z D�wJ�V����5 �S�f9-Ny�f�2'*��_p���c����x�P�p��B�.�;Q�
l�WT���Z�����y^0�������3�Mr	W��䊔I;��N,U�i�;�;�@���B��+W;Xe����KX�]���H-�$P�:e�A���^0"bzC�ԸUb�f��R�}.�J��B��Mf7*�AkF���FS]КvxC�5i��0����q]9wm�#e���A0��{Q{���;��A��n82���3I�Ks��6�����3�X��6Q�1�L�v�Q؎�:2����d��fW���[I� Mt?Dh�O�x��#��E^d����f���i�[ �[�"w6�[2�2:�Գ)��u��+��%�'��]8��"���r~������U�|���+�E�?�d~ �}�Yd�n�Eg[��Tg��g0�����A��0F�����ɿ%�      .   e   x�m��
� л����f�K�E=��j����<��V[@m���#�([i�GVg0��[7��|�j�]<�4�=�RJ�lG<1�#�qs��v%�x\==�      0   �   x�3�,HM)�7�� ќ��%���@�!713G/9����؄����X��X��T������L�"�e��9�J�2K�9��,N���*ά �b�)Y��pg�e&9@�ObQ"gq�D5ތ,�c���� k�D      4   a   x�u��� C�d�.@��# �t�9
*��\b�YO�$�V�0�@4C���P�V{�OH���oh���=���}�D�M���0Ͱ�5�'k���Ft1�o'�      6   �   x�u���0�o������,���T��8����@�1�D7�Mڋd:M�B?y�BAF*hO�3B=v s�w��齨����A�ǲ�N�I\t�;r��y��;h��k5ZY����a��j���,��F�D|�LU�     