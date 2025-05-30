PGDMP  "    (    
            }            auth_db    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    46504    auth_db    DATABASE     �   CREATE DATABASE auth_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_American Samoa.1252';
    DROP DATABASE auth_db;
                postgres    false            �            1259    46517    authorities    TABLE        CREATE TABLE public.authorities (
    username character varying(50) NOT NULL,
    authority character varying(50) NOT NULL
);
    DROP TABLE public.authorities;
       public         heap    postgres    false            �            1259    46564    oauth2_authorization    TABLE     �  CREATE TABLE public.oauth2_authorization (
    id character varying(36) NOT NULL,
    registered_client_id character varying(100) NOT NULL,
    principal_name character varying(200) NOT NULL,
    authorization_grant_type character varying(100) NOT NULL,
    authorized_scopes character varying(1000),
    attributes text,
    state character varying(500),
    authorization_code_value text,
    authorization_code_issued_at timestamp without time zone,
    authorization_code_expires_at timestamp without time zone,
    authorization_code_metadata text,
    access_token_value text,
    access_token_issued_at timestamp without time zone,
    access_token_expires_at timestamp without time zone,
    access_token_metadata text,
    access_token_type character varying(100),
    access_token_scopes character varying(1000),
    oidc_id_token_value text,
    oidc_id_token_issued_at timestamp without time zone,
    oidc_id_token_expires_at timestamp without time zone,
    oidc_id_token_metadata text,
    refresh_token_value text,
    refresh_token_issued_at timestamp without time zone,
    refresh_token_expires_at timestamp without time zone,
    refresh_token_metadata text,
    user_code_value text,
    user_code_issued_at timestamp without time zone,
    user_code_expires_at timestamp without time zone,
    user_code_metadata text,
    device_code_value text,
    device_code_issued_at timestamp without time zone,
    device_code_expires_at timestamp without time zone,
    device_code_metadata text
);
 (   DROP TABLE public.oauth2_authorization;
       public         heap    postgres    false            �            1259    46541    oauth2_authorization_consent    TABLE     �   CREATE TABLE public.oauth2_authorization_consent (
    registered_client_id character varying(100) NOT NULL,
    principal_name character varying(200) NOT NULL,
    authorities character varying(1000)
);
 0   DROP TABLE public.oauth2_authorization_consent;
       public         heap    postgres    false            �            1259    46526    oauth2_registered_client    TABLE     O  CREATE TABLE public.oauth2_registered_client (
    id character varying NOT NULL,
    client_id character varying(100) NOT NULL,
    client_id_issued_at timestamp without time zone,
    client_secret character varying(200),
    client_secret_expires_at timestamp without time zone,
    client_name character varying(200) NOT NULL,
    client_authentication_methods text NOT NULL,
    authorization_grant_types text NOT NULL,
    redirect_uris text NOT NULL,
    post_logout_redirect_uris text,
    scopes text NOT NULL,
    client_settings text NOT NULL,
    token_settings text NOT NULL
);
 ,   DROP TABLE public.oauth2_registered_client;
       public         heap    postgres    false            �            1259    46512    users    TABLE     �   CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    enabled boolean NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �          0    46517    authorities 
   TABLE DATA           :   COPY public.authorities (username, authority) FROM stdin;
    public          postgres    false    216   N!       �          0    46564    oauth2_authorization 
   TABLE DATA           �  COPY public.oauth2_authorization (id, registered_client_id, principal_name, authorization_grant_type, authorized_scopes, attributes, state, authorization_code_value, authorization_code_issued_at, authorization_code_expires_at, authorization_code_metadata, access_token_value, access_token_issued_at, access_token_expires_at, access_token_metadata, access_token_type, access_token_scopes, oidc_id_token_value, oidc_id_token_issued_at, oidc_id_token_expires_at, oidc_id_token_metadata, refresh_token_value, refresh_token_issued_at, refresh_token_expires_at, refresh_token_metadata, user_code_value, user_code_issued_at, user_code_expires_at, user_code_metadata, device_code_value, device_code_issued_at, device_code_expires_at, device_code_metadata) FROM stdin;
    public          postgres    false    219   z!       �          0    46541    oauth2_authorization_consent 
   TABLE DATA           i   COPY public.oauth2_authorization_consent (registered_client_id, principal_name, authorities) FROM stdin;
    public          postgres    false    218   i�       �          0    46526    oauth2_registered_client 
   TABLE DATA             COPY public.oauth2_registered_client (id, client_id, client_id_issued_at, client_secret, client_secret_expires_at, client_name, client_authentication_methods, authorization_grant_types, redirect_uris, post_logout_redirect_uris, scopes, client_settings, token_settings) FROM stdin;
    public          postgres    false    217   Ɵ       �          0    46512    users 
   TABLE DATA           <   COPY public.users (username, password, enabled) FROM stdin;
    public          postgres    false    215   @�       e           2606    46547 >   oauth2_authorization_consent oauth2_authorization_consent_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_authorization_consent
    ADD CONSTRAINT oauth2_authorization_consent_pkey PRIMARY KEY (registered_client_id, principal_name);
 h   ALTER TABLE ONLY public.oauth2_authorization_consent DROP CONSTRAINT oauth2_authorization_consent_pkey;
       public            postgres    false    218    218            g           2606    46573 .   oauth2_authorization oauth2_authorization_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.oauth2_authorization
    ADD CONSTRAINT oauth2_authorization_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.oauth2_authorization DROP CONSTRAINT oauth2_authorization_pkey;
       public            postgres    false    219            c           2606    46534 6   oauth2_registered_client oauth2_registered_client_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.oauth2_registered_client
    ADD CONSTRAINT oauth2_registered_client_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.oauth2_registered_client DROP CONSTRAINT oauth2_registered_client_pkey;
       public            postgres    false    217            `           2606    46516    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            a           1259    46525    ix_auth_username    INDEX     ^   CREATE UNIQUE INDEX ix_auth_username ON public.authorities USING btree (username, authority);
 $   DROP INDEX public.ix_auth_username;
       public            postgres    false    216    216            h           2606    46520    authorities fk_username    FK CONSTRAINT     }   ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES public.users(username);
 A   ALTER TABLE ONLY public.authorities DROP CONSTRAINT fk_username;
       public          postgres    false    4704    215    216            �      x�+-N-���q�v����� B�K      �      x���k��H�(��}~�Z��|b�qw�Ӭm���$��@H:{L�Uq$�6�}��ꩬ��s2z"7cv�K�����΃;8��Hy�Q�2X�(��f ��<_�Y�/� x|�|&b#�`>Č@)�`�c�c@���E�_��9�u����,�AF)��H���2N��/��/�W�y��/_~I��{i�${��,���yn��S�e�ĉ�g��U����ݢ����Y�I$�����e����V�S\{yt/��ﳼ�**�$�Z�g(i1L�f&�?����Z�*M����QX�+�2� ��ɭ�����0(���o+�_6I^eѤ��&�Z��S�~X��\�Gg�Z�������K5^�ݾ?)���7���巅��/u��M$�a}]4d�0��!v>&���s�LI����Ǫ�(�2B���~����4u��/��7�׬��v�}��v(O��v��K�f�?������嵿N��m���?ޜ^�mјe�>���=O�ep���`��5�^v��LQ��%~��_�0�I>��~���_,*ªL��e��]X��Cފ�m4��߽߻�Kگ;u2���4՗�����\ޚ/ �/�.�_�6}�vޯ��赴����;ȟ+��=v��a���N��x�%C:� ��~=d�aͿSF`��+��������2	��C+��w����Z߾�ָ���N�f8ֆR�H���֌)�4��� �g���m Ό���3���
��uE^��^�]��a��
/�"x]������ɶ�/,r�p�=+9�b��9;���;�a�����k��Vo��!޳��ی�f؎}M�?���c����O_S��_����,�������?��O������`���y��;��O�����4u�M�l������m�����j/iQI�s�@�s4}�2�YHkqW�EFR�iol�n����Z�)��T���3���<62U��1����"	V&�E2���������SS\��ݞ�. �
�_X����_X��/���}B���?����z��Ҽ
�%)��<	=G�CM}�����q|D���3,�"�,�x,�� 
Cď�����R�*BJ� c��d�h�㈤A���[��Fo�4o�����n&]2���ê��L�u~���<	wŶ������qs,ʝ���m��������'v�u��`u�Sz���@o�#k����3���$ጫ0�Y�w�{�jV�z����u�!���ե5��g=�s�%�^��{�k�쪟�|Y{W���Z�����IMx^&9'��/,>{�*��:<�7����ڢ� ��A�`���|Ą���zϳ��Fm}��8$�T�UQ�	%I "�QS��I��Fm���yڒ��e#RRQU��l~�6���%�#����N�gL߯���h+���[&�`/')g=�,�Yi{Q�/m�S��|=/?��ޑ���;���ڪ�}c*�,��N2y ��]��#����>�%�/x�]ϳ�m�4驴����|X�#P
ɦ�2�7���Ifo���������E}{t��Uڙa'�z ���J5�?����
��X�6�����X��` ����B�C,'�,F��Fo}��$Y�4	�
�e���*�H(���Fo���y��J�B���MWZ����PV)ϳ���{�p�v�y�,�?�[�jj�]=O{R!��~��]_�OrQi�z��VM��M��?��ޑ���;����*�Ee��=����W���t1o���db�5ڷ����\^��bk�g��揾�����q �}�pS��
�2�;��0
��m#d_�#�;ZD����ԕ�g���[Xx�X��go�����Ka�#�	,����	�aA����x�M���ޢP`5eUE���B8�#�%�Ő#���[��~��v�W�X�}�]R{�9-���4��q7;�QSb�ǋ��ܽU��d�M6������{+���Y�'wZ�©>�Z���O�w������}���wxg,���M/�������Xn�mv�R��)L	��y�6�.�_,h7]o��������8��T�َ���,��y�PY�$��=�f����Lf-#^�ʮ��*�@_X�BxP�6$|��ފc����b��-��$�	B��g{k<�8�܉ɖԗ�]elSI6����n��۹MK�|�C���R1֍N���,2��GS<=pAcƹ1�ሸ�v��g�w������G�	�k��L�`�L8m��X�@qTfY����`���7oe���|�o�ꢸ���o�b�H&s������=g����-�4Q�K�f�ܖe�94�|����rrpzLOU9��~�FY~w��6�E��{�n�p����N�>{�*V�ɀ*�	�B߄>�[_s����՞�N����N���O`rp�ha[�a�4KہF�Aq�Rك��ef�$yv�'�0�l�<uh&3�2,����0`���ܓ�n{��2ٳ���`l������a�|����csO�삉�,�[�#)����`:�yv;lf��*@��:�pjݗ������G�#,���P��f�TL���L�u=���a��9���n����rv��61�uc<E��0��c��wþ4�����,]�N��eg���dίg�5vV�}���ha�\Cd�9�68�&��������9҆���u�G���yla7]��=O�r�\]�(�5 �z�oťӋƤc�dw��b���v�� v�M�F�5[�6�@�_�$�֦ެd5��e�FG��2c�]�;<����n��q#%��'����q(e����fF��jl��T][�N�Er�3�)6�|�0}_�v����항��L־��d�1��_��*,E��{��'Lk�3ϒ��gO����\{X��q��Q�w�������/�)}�~�� �uj�/���a3�t���_ϪZY����጑�̫����?�C)��3ޭ������~��ˆk�ⷓ������-����l�<zы�^�0���C9�kVJ ���?N��������ZS�]Y�2L=��y1�b&����J�W�B��ǘA d| )�
�h��;�]�J�W�o�bm�q�P��y��m*���;��!��]��Z�x�%�A�:��S�[����P�s�5��Ż!�.{���kSl��_kSWC9�5�\b��ǰ��gIz��M͡"��B+T/d[X����{9Ǒm�z���v~h��i|��������kٯ�����>]���~2草�/�5kN�f�H�!�CM��m&Zn���y��m���V�!��!�ku6��ϱ�����K9��N([��3\89�D�C�Z�_��9��i���]8�h��c�۫W?v�B_QՊ�1��w�)� "N�*�o�gH.�,�u�e_�������~
ƌgh��b�nW���2��^���q�'�}���'Yj��&<��\��k��bp�\.f�Vv"͹�X�]�|j��S���v���QV�1W�	�W+~?[���fy��~�����q��M�աi:�z)㐩����nmN��i��q�v�a��4�t��d�hY#�0�Hz�roD��)m'�W�)w
9�U��}ﶹ���5�0��1�����q��+c�Y��M��Ls|����<�u�o���C܇ר�����wԨ�����B�Z#�#�� b��@�3��p��l�����Zf��a��i��r�l��q7E��Q�̛H*va�X���N�����6H�*h|,%g�,/�E��(��db�[�\7�Hi.�[�ɧ�͟��1mW�Ш.W>���4��h�I1S�Z���<q�6��C:T�^�W6�Jy.@�{�Ufĩ��� ��c�����VV �0`|�Q���0�9�p��P���:����VV��� �'Y��>yH�%[����L[x{5��5Z�ŧ,a���`��V� 7��r�A���)
��s���#���������U[Y5�5NSU�P��&����@&HR��������֮����Ig;�/�I6Jյ�.�w���`Ϊ�(^6k�[,ŝ(    ��N-d!z��v�l�x2������l{7���v�����l�LZ�,f���ئ�v��=��3~�(��/0y�ʊ�7��_��bC�{�����KE�Fj�me��u���������:�uc�������V�d�Fc�ZvP��a�v7�0{�����d4��܈U�[�|�Ũ�ooL��cdn���N���%���A�:�\�}���������U�X1���9�d��۫�d$P-v�n�y���dl^�����GnFV>�REf,�*Y���|^�������*\�G�ofqu%� ;��N؈�w��ON7����Y` �fݖxSY�%G�~��3�{�Gr�f>w���������W��õ�/Z��qrQ�@J�6�VbE`������=�mm��z�[�� ]ά��fkx�E�Պe%o��صH��o���E/����oBc;�G��
��������* ���V�?�_��c���ǡ��q1>%���86���V�O��:T��������k�������H��Z��!����R��C;7�����[S�0�f��,$o�˲@���>g�mC��b���)3�C�f{=T�j������a�eEK���S��������G���\�}�Y;��m�5}��B� �r����aL���:`9��-2��J?���L:�
��(�ҏ��=�}fg�'�ۆ��~o��0�unݽP��v�2q�>�M���������;��iY�I�w[1JNg�uq9'�G��b��t$��uZ�ퟎ�o왼.��z�����_R�l�p̵�(���;j��ŵr����t�<�98犞J!��g����P�/�S@����]��5e�@ē�HOY��'��3}�=�D�U`���t`�r�vi��RE���(�����y�bf��u���I�����DZ>]6�`�֮�֏[���Jb���	~����* (�>�B2�[j�{*�of�ǚ!~��C����|����%=�=&c4T�T�}�oͬ�uy�7x�ć�~߶F^.�I�r�@�L��2�@�m��Uw���7c�#WH���cʙם��R�M�J�N;��g��ͷ�u6��śfnm�"'0k�)���t�XHEO9pv��5Y���'����,v���*�}o�d=����>������E<&�(0�!�q,�p|<� �#?�-*nQ_������ʈ/�
�L �9ʉP2�ı]�s���=�%z4 �0�Ȯ��2��7LS��㰤s���K�7}o'>{��O�U�51��������&����7��5	�mo;��g
���i�{?Zy����(�ӵ���Ų�p��?�啱���J쭼 �M�`�+�ʱ}��9�^���.H���efO�~��Eݧ�n;O.?+��ou��(eY�m��&�Y���D>�X&B˼����Č�����QH���{4�8��1�Cu�iX�Y�e��P%�6m4������,{P�V,��<�Кm�ߖ��0����g��{���c~LVa.m�fA�r�Η���6�5���� =�\�yB�)��xG�>�n�wd�ß���[�O&�y�h\~�O���S��.�B;|Dyx��rşƿ^����R�CC�]�y�Usѭ�U����M{Y\cA����,�$�0��[�<���Q�1���Ǥ9O����X���בҸ����gՖ����1�Y��8 �l�\��?���Q[�y��J<RXc�%T��V��Q[��Fm�4m�'��9�1Y����bvON�?�M�lu�sdVO���cƲ����X��`��	�ПT�sG>�M.0�Y�R$��Vw�)����}�X6ߟ��3��0��s�i�Yt����>��.HǏ��k',?��U>0-Λ�D��sp�SS酿n\�R, ��/=ju���E��w�ak	�C=��k�ҺӞ0ͯaw������`*��!���B��07��>��b?�HH<�"�3㇞�P�!�0��֭�[��-��c�  �4E�DT�G �%J���[��~����%L��Iv���Iw|�CS�'�J3�3�C��
?�[�����.�l_3'�T��{Dׇt����������ͯ���z�Y�po=��9��:�eex7�]�Z9T�ai��jK���~�����P����`�H�z�*W}VP�|Tr&Z���.n7��,_��99?�M�./�*}�� �̞m�uվE������WC��-���g���7�	0!���R2>��	y$D  17�i���w�oD�����Xf9N�D���U�%QԴ��kTר����8�w��l��F��6i�p�޴�Mֹ{ρt��.�c��<q�0aHb���m�ƒ�oVx#��/DR/ 3���I�ӧT�;����zG�>\]u�_���������sc�����>+����7�����d�=�z -)т�Ĺ<ٞ���X��u8���]`��y�c��y�X53���(�J]�����6n+M�Z����חd���"�7!|���
8�q�D�/����PE��`��<�<nTר��7���B�i���<�Tr<17�3�0zk����֔%�I�$�����{���B��p�Δ3��9����Xc�u�b���q�+�eͅ?[�^?�y'�h���e�������}��ޑ����-�R�DW�[�B��v̥ uZ��KP� {��z-65�d����Oױ��N|$�������-�������-���L��Ή�&�AmwkI��L��1��bu~���w8�_�B��g��H@A� ��%��A~�'$� @1{Go}�h�D�@TF"䱪P��(�e��&!8zk��譟�k����8��0�i���A�T�c�+���,�+��Ώy,���'Oe5�;�s�YY�<��ɭl���Q�����w��#� ��Y�po��nŐ����.jm��t�˛�4�c��U�ٶ������=����bm~v7y:F�����ZY��<�6Zh�5�&�Ĺ*�/��p�V��mQ�Wt���m���-��u�BL���C��[y�y��>dp�BF�|�	�GBH_��7������-����;�E�aH	T!��(��"V�5zk�������eG[͉�Ǜ@9�dw�~h�O�0+�~��D?�?Q}�+.�u�ͪ��ݞ�J������})葉��Sz���@o�#k�D�t��H�{)�b=u�-�����~}}L�k�>���ˇ�>4qZ9�d���oy�Õ`��"fom����/����ť:����0&����kEyp&�7;�v}3:&�p�AR�U� /����oB��[q�C�
���'��l��!�B��)��[��-�ʘg9,ʜH(�d)/R	"� ��e���������lO�`��}�x� h�9�ux�MK��9;n��1cB�6���&���ޣ�t�}��>o��Ľ�gyͶ���9����}��ޑ���b�����������f�|qR]�it�mO�E���&�������܃U�㎛L�O��J�Xx������Q��{'��b����B�Չ��nr<�C_��V�W}�gꩨ��[T�7iQaȽ	a���g���\���`1x�M/ 	 $�ـ������zg��9L VxN��I@X@2�dm����[?�[+׽���M{��ŐW׻��f��q�w�ZRe,�?�?qڋ��@������D��8��s�G
9rL�X;�K>�\���G�'~�>�[:!-w<�x"yn)yB��������D��t'�4�h��q�j�>*�n���q�"��b�c��u٢^ז� �����U��.G�~�+ޕ�Y�t��Z�{�*�p/�' �oB��ނl�s��� x��G�c�% Xģ�[����[H�4E��uQ����$��5zk��O�Vu�'�av��P��]��r���ԞVz���#����r�A�[�z�O�hq���?]�r�)���<��d�9W3"�f�����;�������}���c�������.������1/��ۃz�&e���P<�}�:1[�+i{I+�:��|���h+"�1_�S��y���/]�z�Ĝ�����+���,���+k�Xk��-��/�{�����M��z+`�    ��x!`0��@)Hn(uă���8*���_�����N#,�0/C�XT	�T����[��Fo�4o�U����_@g[3TZ'�X�z�[�O\e֧�Q����c�ߢ�dW�f�f[4����MfKuw���`�֘%����7���O|G�>�[��ڇ{���M��3���<*��p��;��̀j���ۙ}�b!�6�NAG6���l��Ш���-�Yv�N�\���T�
�s�nV���9��N~("y�ox��|�tk���� ~!�}�*�!D�	}Vo�(B/��@b<x���p���S_�ă��Fo}���iĲ�$��AR4�a`�FTU"��Fo���i�ڨA/µhg�a�:�'V��ʣMWA�,�U���a��� �^H9=s!t%��~)�yn6���KbW�����Ƨ��;����zG�>�[��ӏ�j0�eFN���{���m�����w2mٰ��E�\s�!F��N�<P穀%x?h2����ˎ?��Mn�v�^���ymo����V���o��]�P���|�`���QOo���ނ���1>����L!�T�(Fo�������s (Oe��4I���dU����[��~���x_�-��%�z�z%�Vh��\�����v�B`���x뀶���?Lo��������dq��yW���t���ٟ���}��ޑ����[���z+��V�TL��긕�P"y0I����2>׷��� �Q�d����z(��"ǭW�kf�jW�>
�(N�M=��O^k���/�?w��c�?mz��B����-��_(���x� ߄>��B>"	 3X��� |���H�Y>�Fo����� ��2���EA�T�5I�����ˏ����Ee��l�o�kܶ�?�f����~��mvk����/��N&���]8;j�����a�+WY=;�o��-����z�Y�po]
��5��xz%綡{#m��� �e�]u��]�O��=-6�{�աsO3ڴV��w��3�m�}���^�Ws����ݸ�ֈ#���p��+o?q�Z�u?����x��`���o�[�z�
�_�¾?P���a�,B1�
4���[����[�UY�bH��rSU�dIPD�)GFo�������Yy��I�,i>Ҟ���M��+��mf��v\LS�C��oz�+�i݆�~��B�o �/z\9��O�"���Jo�#�wd�ý
�|���F����R�u�l�Ī�]�
4y�MW7�sV�%�8���e�ɭpu^��AV��u���ݛpg�l��`�ӕ� �M��k��d�w��^OD/y;���-L^ �X����~}Vo���X�Əja2���(` ��aw@��c�����H ���Q�׈"cs�*,bEFo����Ӽu���zk�M��4ZL����<v���Ι9��*j����O�ޒ����#Z5���r�H�j�F�ܶ�γ�R�P:
��[���z�Y�po�ΞΊ&�aG�}~�������iu�r���+��^���^\�{P�3fz0�^`�m6L�Y[��������O#k��������t�0ή��j�sz4�����-��/���oI�S"�M�zK�4�c�c?����h����Q��aH���[��-V	�:֩�����)�_G���[��~��R�y���dMxj���z���Re�!��I!�%C��C�%ɋ���]�y:3T�]5�P?LIY�6��)8?�W��)����}��ޑ���nwgSFj
ߝ_o�)��}W��v�:��L15�	:�5�cu���1���myM�N�˓S�<1��N��ksϮ��|2��L��NݩU�`˳J�q�mk���)z�*���A��!�M�z�$�k1�C� (2f� ��z�����[��-Yd��A�H��$�&�"� �p�t��譟����d��I��tu�rĆ�F�� wi��iw��~��<�ȕ�<L�٩7��]��蟜{ ݽoIVe���6��O�w������}���49��ܼ��2klf���[���ӑ��>q.U�s�L��#�iΠ���"�O��S1k�<{4nC�E��g;����F�y ���K; ����\p��.V�Y��4b�/c�mw"d�|Vm�8$p��?h�B���И�AQ^�wo���nm��XV �: KPU^CH�,� cy�֨�Q[?M[��O1�g��I*��Z��iZ��la�[���k��(1�ğm�p���&����l�������s�&�#��wd�õu�eqb�^��oW&V�l�bI�K��H^u�p)z6m��ݓ[o7S���^��sv����lƮj&�s�����f��H�i�`���n�� ��e��C$�[S�/���p�mo"$߄>��b/$|�L̳,�����<�|�B�y���[��-��pЀLUIQY(��U U�co���[?�[��6_�Ix�]�f��I�Hw,1�3g����o���}�����=}�1��:�}ez}I�㲵�fO�Y���9�;����o}�>�[���N��a_�.��f37fGCg
<�j�I�d.딓�GY��-��H&B.���`�B)lʵw�Ok�yޅ0_=~�����Gx�D��3�yAK�_�E�B� 1�����oB��[QȄ�J��.�C �	0����[��<�)�E*?���(
PQU��x����[?�[��/N�}�_��R��'y�:��L�w~��a��������党�El5�M��I�D{�i�ΚҬ�4�ZT�C/�*|Χߑ���;���޺�WU�N�l�X*_Jt;���Q�9��0٭4f�Ɯ%7�>	E��I��8�g�����~���S�b�달v�PE��K{}6?ϟ,��Q�C��"Tͷ�b_�������E���M��z+ G<��a,0��b��8�� +���Oǻ�Go}���AV
�U��X�DV�ʩ�D(��ؾ5zk�������uC��<gy�o��q��J�)�+�o����z�cF�g�GH�E���^s��b�f�J�C|��$�	�s P?��ޑ���;����:Nwa/\V\�^L\:�g���+:L����7[�6/.��γ�SP$J�t�F�p�o,w��ʮ���#ͫ�ʊqd]�f��m%���Ni�0�W�6�ӻ--��P��
uӾE��G8A����oB��[��,⃐�X
��83�@�X x�8��������m�*!H�$����5L�&C����5z�y�d��s[�sd���s?A�t��d��s�T�d�?f���A�#��w�|�E�Y�B+���Z3@�IM��cfY|X}η'�#�wd�ý%��қ_�8q�x~u�G-97f[#VkI�%:���(rYY-ۇV����]&h6�6^�KW?�nG�~z��]@��ujoG�m&'���Y�<{����+�����������o��ѷ~}Vo���%���(bp�Ō��	}�gC�>Go���^oI�'��*��!�Ȃ((�
�q@TXi�O�5z��yk��	��y����=�r��b�x�n"g��i��@���<�h�]���̈́�|, eW�/X��G��s��kΨ��Sz���@o�#k�-�N�rME���h���r����1Εc�iq~��*�gK�t���ηc��E{��m�;_������=c??l�cb,���_���{�K3VWFX�f�W�z�~!�)aٷ��߄>��y&!C8n ��B�r�c�Gac@!�5z�{�ūP'HD`e�u(��������X�5zk��O�*玶�9�vk�::��U�y"L�d�������m~���^�2"��u�	�_\�^_�����«z<���}p�Jo�#9��g�ýEY�vT!�H>1T��9ám����|�Uڇq*%���@����V��3����z�3��d~*"1.LZ/�r��<�w�"�Rb��Y��~k��u}�G��U�̿ �1y۾�7���-��y��p�����<��l�<� �5z�{�E�4I��4�א,�2U�q��<zk��譟�-��Kם_���
    I>mRz���[�VŮ�{�EՏy>�����J�O��a�81�u�ﮝ?7O�$,.
j���>������z�Y�po�
�(����$s��V�6����Ӳ�����qۆ��vN.5��"���()��x����$i��Jf-���|o��CfMg���C����V�	����dt��EQ/�z��9��@ȓ���߄>��`c���^4�ó>��g`Lb��8�5z�{��!^��b^�0T��sjP�VD8zk���������̰�v_w�>���,���x�����H�r>��(�S�q��bf��-Y��q���z/CcU�D=;�3�j����e���\]e֟�[���?�o��߼���}���Kk���,lV�#=Ir��D�o�@W�3#�wԌ;˩̋?9>���0c�}��5Xdr��OvGw�c�^wSL�9r��O"f�����K�8ߌ��6Q"�'���N���T��ȾP
	��}�߄>���ȃ��	����X ��y���8�������'b��V9�8M�p,�H!Q�8zk��譟�-r��;+U��1e�I��t�`�<=�gn�Y�a�i�cޞXTI+X���R�?�;�yЬ�d�}�L��I���Zʟ�[���z�Y�����<��gW��X������v���"ϟW��%#Q�1w�e:�ei�^���q�����j@�V�ß՝s�:�Υ.����-8�����c���=��E	�|>�*���=�煷�oa�M�zl#�3ď@��0�R&�1O1�h��o�������oު�S(�%NP�"a5U�8�
5�����Fu�<u�΀ixO��v�� �-�-���DY����sfny����*�mݔN���6�b�js�Mʖ�U7���C)��Y�R]�����Y�pu�3t���9�y
��"���䧄xW�D����8$f��N�}f�`Y&S}���]���r贩�sLM�X�:��"en�7��T`s��+��J�����S�핷�B�C�SL)�oC�7�O���Ѓ>�a0��Ѡ.2,���*DFu��z����*#��� ��_\$%
� �Fu�����ں����^ZX�\i
[���<�gp�}���;H������!��7��V�=�.�ˋ*��]aB�^�{{b�B� ���s�5���}��ޑ�Wr��p������B�����ܞv����:����KN˂��~��ͥeni�'�̛q�{�m�$%��:��^.<��j���xJ��"��\�oa#���]�@�����/ ~����C�2X�����c�1��`bT���!i2҆=��ENQ�������4�3�1zk����V�z:��3gRV�JnsY>��LX0!{��ح�&t���-A��si6?,f�<\��;��Vƞ��8Y�׽گS�9ߥ���}��ޑ���bn֨�6��q�]y���{�~���f�S������A�?\9*΅�|x�G;;��r-C��L!�.3�<�!���q��b&5-;_-��S��><��������9Y��[T�/����oB��[�G ��A��ƀ�/d(�#����[����[��.P�RQ��,Xx�G"�E@d̏��5z���*��y�lJ�����Q�>-g�<1��n#�k���ǭ�?�^���[�;��^5�-7ʩ�^}N��zW]�ե�f���k���@o�#k/^n��\:����Lfw�$>���rb؆����Qol��U5P$h���z�Sz����a�ұn���I��R5���/�M�����W��r�>��4��M`R�FK_Ǳ@x����g��l�D`�ǈ2� ���%ȣ��cC�g��g���*��a(~��-��&]�;��Ii��z	T��1�`{gE"�ZZW|��']�}"F���=�u�!:g'�>�S�����	ޑ��<��`����V�&`Q�E
D��P (X`�H���s^�}���溰)<(GG�C���_wd�i�����u�.3�t�$0H��¹WI�z�u�Ġ��N��BI/X��m����2���v��Ey�\Oa.;u���֦��U��[��!�m��	}�����/Q?�=w�,�i؇�p�|����u^�F��׏}ӥ2;��۳���d!���$�m���dF_�>CW��ד{��m/zZ&{�Q\��~�s��3� �O�n(*k��$`�.�8�2�%>�2?�.�����g��f+�d�����}��?���}�>2�2��_�ES1Y�*2� �3�ug�P��ª^�i('|��x�����>�`U���d��4��%�m%Cl��!z^􋽼L�k�=������9�₊�p�wv7�2D�Y�\'��Ӛ��2�O"�Xj8eW>��մ�/�ѻ���A�_��vVVSt�l��G����_L����OMm��Y���Qf&�r~�M<����9�����V�9ܢ3��0۶X�et��ty� ����x�v��Κ�JVhr�2����&V��=U���.��a�vǽ�_�5[��-n�^A�in�K'���|����:29�JP�ɩi�t�@=L�?oãq��3�oO�rH�������=Tx,��/{o��&��o�����{*��sbH�����y�ço�������e�k���Q���D�c�$��H�h�I�񏫄�>[/��
 �>-�?�U��ކǲ��c4�F�.M���c�e���x�#z����w�^�·�~�Y��h~��.��9�m���k��xD���ѫ u���~Z#�ϗ����;R�οY��x�WW�����t������f����9�j~Yڂ$��dXFDG. � ��FXFF؇���!�e��~d�oR���r���!yb�L�c?��&�޻�>D��Z&�O2���˘L�4~ݨ)��c�3F4\5�E>�|��Ư�Ԭ?ʩÃ�<����彦��|D0V�����Ή���O��,�[Ta��ja&ϗ��7���]�F�K���!oOW��}L���#�]oU�ÔԪ�]MmS*�p�qg�@H�iT�5ث�Bi����ǋ �
T8L�>����cι��3�4��u��Euu$$f���+�w�S��wkA (���v�a'�;��ڞ���O#�S_?!t!��e���||m�k�d�Z�*���
7�|�e���Eт�H`�>�k)g{���F���cf^[��b�YđV)�0�M{΀��Myyrtumt�� z���S���_s�_f�F�"j����V���
�>���4�U@��16AD��[CXH�y�T0x�q��GlfCk��ɇ���ò�/���XoFK~|�i��Gd�s��fWV�d����m�Fm�E�yx���u�'I��F��M�����y5��3��r�	^����c_��+!CP��K*D�|KP�.���5�Q���H�B��z�s0!� ��$���/���|I�"µO=�'h�ܕ-�^=��\�ED�@	1"�-�L�7���c�Ē�N+��$�EI�%RO�k�簪W���$�T��AojؠH��Ǌ��(������́�	���N�~�@ET$+n�V���x	]�?;<�M*��@ ��̄|n�[���#� dq(E@ f!�8��0F�Y��Y�9�O笂t��4�9�q��6�	��Ǚ�zO"�E&泟��M|�nے�[DJr�e�mZ��θȝ�k��]��%tO�_��~��~ Y�?���w���S�w�T���Yߠܐ���>�/^�?G��c)a���z��BU90%�ȅAs荌�Hb��9���3���O�:����/]��v2��c%�a1�p5�T��$߬�>��v,�!�m� �L��<5ޔ����"W�Wx��c���2�k�[���_��"xG���r��2����cޮ�~�//�u4��'��c�P�y�����'Υ�(|A���xg|n��V����X��'�O��꤂b���D�4 �Ӛl�����ˈ���Xz
���6����R
��{tHx��(�Q7W#�8�>��)������D�WqG5�>ޜ�`XQ��!䇡4��BF�����:����R��a�|�    ���DZH��zd	)�3�s�le7N�#8­@&x�mv�ۓW�r4���᡹;n���dVͱ
��Eu^�%�߽��-R� �q�U�����P!)������1T>�މ�#���[�_��B��i�i����>U0�8NIG2 E3 I8�8�H*F�߉����(�o������DU�l���/RGD,�5XQT��"�yzu�-z�Zi���,IM~���5QE�J�eAj��i2��WS[��:ٔJ	o7�������FT��Y`�r�O]��8I#1%��>Yޅ����OQ{��Y1��e�`�Xf�JQ䰆m2��Ix�%G�NA���#)��a��w�od�u�0��q���,<O@�����^��^N �0Y_����"��|�0�V`y�B锓�^��|F��
�U� ��P\qf�$c�"w� 't���i1��k���]�r�N���m/hM1I�*�� ����e�G7�E��hZ�e
N�r)M�>B���.�k�0�b�Q�p����!)�嫢O�(�boL�k�;Q���
c�'ߢ�K��8�.�D��`�wOM �S �" A,��0Q8��D�<iǲ�w�>���WCM5���0N4�V����>BnS�j�Х˺��x��Wi�f������H�:���䘙��LҬ����YC�)e�`O�Lكo��s��KT���$� �I E����"$�b2��#5~'��D��U��1�4��Z�ڌL�8���������q���U	V��gQ�1��GB�ε�"d���!K�(�c���!���HT��O�D������D5�K�WAK�?��MW3Bp���.F���L(��y��X���ڲ�	���+�"�+ZCϬ���ăT�"Q�N$K�{8TCuV��|���O���=!'A�����F`$�}&^���*(��
UnQX�kD�ñ'����c�� �2{������W�9�rkV٦���;�I��\��]Qܰ�QY�4] �nW�HV��Q�
�#i�O��u�	�\�<A
�
��QqM�F�3(d��pKYHֱ����%㢆�]	����D���
�q��)n�XV_9~%�ԡ�yv��d�b�_ ��.ZPL:�US!�����I�܃�J�Z0B��⚼ևV�Ղo����'7�ς(�t�j$�g����_='��j2���G�uq��[̠�����Kj�\[h�I١� ���ٟ7+�{p&B(��a�,�~�w��+D��
%�/ʕ>��'�;Q��D�ݭ�/MT�L����7>&�Tb)����:�?2!�e� �J���!��߉�7Տ��Q��ψj�o&�T�=��U��0�냡��a�tVF�Rl�CB$�m�W�N~MT7�jJ��y���Ñ��h�j*�|���h������,�?��Ϭ�-Q|l7�"���+1cQz�l���c�
I��Sŕ�|�T�Y�%��'��S[�ޗ�O��/�V���˺���BK��fV���y��I�r�׶9��������=��O�9���6�O�$�%�RW���OMC$�xc�ى�����<S�l^�d�0	x���}�ך$��tx�_oLw�j̧0�V������Ӯt	G߻ ��׶�������wIآ!���ӹ�P�E:	�$�aK�@�C�V��ϱ������bo�N�k�;Q��D��[��I}5� �߅ƩFA 3�8M 
�! ���&��'խ_���5���@��Wb��U,{��v�SV�,�*��UܰFX³�"c�����'�Q�E)y�
ȤU�G�Sd�H��e(� k�z9m��=�kzN���s��� ���%����� La�&/t�1�)�$)J�x�|_�w�� ���?�x&�0Y����m_��ʪ�n�Q���8�NW
��Kp"�_=�����v5&�[Qף�v�+��4�_��w��Gv��v������V�(��9��0�8V�0E�<H�������Ikᢊ:�p�`V ��QJ����D� }�`W��ߜ�!��ݱ[YX$W�����eLp���<<gOY$d"6b�������y�X�T�����!�Ke#�Ӊ���
��~É�+��6&^���I+�i�ꯑ�����*�x�W/dG��F�ʻ_\͢Q`�pHR+*��zf��$�����a�7����=3�P�pgv�$ji��}�Da�A4��ߓ(�(��)L���Q\'�̟��wt�H��@���)��:'Y�������O���a�{n�Xp�����n�O6�H�%K',Yh,F��w#		<�ϒ���y�s�U��R��qJ@�Ԋa)���XXzL�i�K-��p<-%��W4����Ǭ�o�x���JKdĭ�}1��<��s��.� !qCT]���R�-L/k��&�w q�h�9���ߝc%~�dŀ6�o�f|
�����NY e�?:���7��s$�f����1}ٚ���������Gv�F�$򏠬�'�������~AY=�3��՘"�Q[,�K��c�ߊ��7oO2K(Ƹ����e�~�[d����! r8�pZ-���H�`�p��k��&�.�I��k�*����D�@p�ky��8�l;#�ETo4�^��=��k�5fdJ�����]5CB����ÙK�@�q���F]|��؃�B?N6��p޶�`wz���,f8"o}W�%�p:n^]�{�8�l�E����|q���KpN�,(�5�;ۓ��t�?���F�f߼(�>Γ��r�-�<s�	h�*�F�>�x�2.x8z?�ݍ_����{c�$<��J1��%+�z�������5gc��Hs7d\.��P�I���2C�ԭGe�<)��^��_29h��d0��!$�Q.������q��6���QEg���������O�����ßAY��}~����� ħ0E�0� �# |��@��H���*��:,�^`n��ǣm���$﭅[����.�h�0����ݽ��P��x' ha�E��g~��lƯ�V�`]b���s1޺����$_��a[F�mN�.�����$��}�]q�iu�����|�HkC�/~C�O1�|n�{)k�i���d� �� 11���S�w���)k�)#�,e��h��k����jq��V]xM{;r�j���PVu����+lη0��i|�%�����~,��z�C!�����U��O�4�������4U{�=t�2'�t�*q�	�1�$e��!/�PHשk�#�&J�bg��OS_*��]���K�a#	�Mzb��8�fe���3��Z5�b�������y|AS���$���S��Ij~���Iꪰ�WH��c���Z�/X��Ƴj拷�G�^TW�i����]j���,���U�_�3J��@���D�x)>sg��� ^�QL�zgM�*jK�>Y�'����jbGT95��*S_y�}<ͳ��h�9��i�p�=	f��YGl��T��J�&�4����rg���֘c��J��5��I��S��]��!��>n���p�rQT:mh�q��r�	
�����'w��ia٨@�N�
�-�J�%���f@�J=��� W��L��{>��%�
c	��A����6����%~�&���`���������C�F�e�@z2&��⋚�#L�� �����^��iꏣ�$��[�_��Bo��������DS18II� (�}y�1� ���C�0��䝦�9M�>
������y�*��2�\���d%<S��mZv29��);�j�}� ����SiQP�_��C�w���x��RX�>�*�|�7�R��(����z������h��5�\k�T��h�0�b��wO*� ,�Yq[ұ�X�KY/��k~B�!b�+���t�S�k�34t�y&;�����U��ݏ"q�o�:;��b����A�	2����sj�L\��.�"X��#����P=��XE9���i���_���I�+L����s.Z;֝����^ZWz7��N�έ�%����/��6�}�hNQ���f�w��K�M��DX6܇�R��y=	T    �Q�\j�P4U~~�V�Y{��g*^�K��3�_w���<�?�>�_��צw���i*�~�-��] �7�
l�]���J� �p��@"�)8�R(�~"MņΞ�	��mU_%��]n��K榫���>(*�f:��tu�"fLeY���K�fṆQ�K~$�M�i �t��M��!ۣ�P�de8�v�`br�3{|k ���^��� B&h��1�J! <n� %!|�03D�i�;M��4ս�c~�9��@]Eu�#ni�uw�v���
������ٿ�_�I���ك����D9w��L�R �������/Y�����l�;��^���NY����-k�N�S,���0�S'�ı8�<�2�;k��YkɅoJ۳�I�(�6MH1���܍D�`�`��1��DL�c��0��iP���"���~u�k�>��<o$L�X�8��#�����<Ӄ�����J%�_��`�7��H���<�鿞����ﺺ*U�5���ؿ�VoA��_�f����U��׫��/EQ����~E#�cm/�������SF��,�����	���f(�VF�|&<gM(�:HG�'��]PG[f0P3�"k�Sm ��>=�V�*o�nT�4桼b�N����5��&.3Z��/��^��.Ny��63K��4���|�X�D�OB!���6�h��S��N`7�nҁ�O�~Zh���V�9R��1��e��1����w�y���i��e6����ʬ��ʤ��=���Mt��4v�!X�
A++B��0�d���8#��B=3�CԞ��}Q��!T`
ÿh��1T>��y���'���/�[�L�������FÐH ���4�� �# A,�3�e�oE?	�_���ꡟw]��UtŢƤ%C�E�.6n���z����Z߀Q����aQ]��@��^�d��<3G���C^��ڬ
��m�kUq�yk�{� |���bwR�A�Ye�>���g3�n��e-`Ε�K�m%������)$G#ֳ0��,K��j�"e26��r-V�4�Y�)j��Ǎm��$�4����`O��q&�3��st���\��s�,�������Z�`~~pU�lC΂`�ݫ�KC�鹠'�6�vX'0����#$��^�X�	ts��"��~]���٬xק�'=E�
b	w��
���������-4��M��$15mD}�-�
hbv�R(,�l'���l�>c�S)ʍ����?iEoM�C�U>�G��^�~�Y�!�ҕ;�u�G@�o����[!)�g�V��o�o��|3��O�Z�Ip<# 4������q
�8��>V�}��@B�}���,�Ü�kW���Ι�#��X�����e�M���Wm�Q|�� ���܃�]�+��
c�L�.�EL���UQ�h��z�A�`{i�=���}b/̚����G�	lc���{F��v�j]D%��|�?� ��_��?,/m�R$&a084�S��
��<�Y�%�{��;m������o>L�z��
��4�g�{V�n.���W6=�Sh��Fa������d��t�����%�^c`�.��/I[��?��~���i�;m��5��p$�!x��	����`EB'읳�^y4^W�7�����~s�����-*�^�;S��s��QgP3��9z0��/�g9d�2�>۸՘G��{"\'����ę�"Q�5Y\���v�}�t3����ȑ��1!�+�9g5iH��u��bZ_r�O�����R���g���3�K/V�ҫ�÷^��r��;�*��X�P�JWg�V���F��SiP$�ㄧ;��Ұ���|&�nE#��)�xUGI�#O���$<�EA�7q��w�{ҩ�����F���9H<��W��TR��痫�Λ�T�j�%,P8-Kʃ+=�'����TߊcI �zg���yY��t�o�R��0��g�&�!�y�c��YkfZ�?��33����BE�^�
��!�C�d��-�~��ĭ�jI�O˲�|r}�L��I�C2��{D��p�6z�O ���.�j�J��d����~і�C��|�r�O�w���8+b�����kE�L�Ϡ���1���#_�C���34�,� 8�q�ģ�H�u���I(�"g�?
��u�Y����<%n+������m͖�A��I��(�f%��)������z����_׵*�a����^ˡ/�[=�l��/�e�B��Z�d�w^w	W������L�С�CQ/Q�l���,�\��aҘn��Θ��eȧ�R%-�d�;H�tjd�e�Bn>�n*E�7�G*�aqQ��H��D���f�:D�Sk=S.D�T� �w�H ��=+6@+��j}��ű�4�ɏ�T������(��&Ų��ƞ]�V ����Pބ�
�CZ��[*ʻP���"���mV���t�وWlD����O8��pk����y�8��66��]�mr!������w����0��ɮ�P7 l�>UNU#�t���6�����j�+�F��{�����.%/�#�>|��� �a_p�צ(g}2%~g%�O��F��AR_�k ��$D%0�H� 
�@p
@(a�#d��.�{�����'2�^ڸ㪦B�ӆ@��J�QI�)�7�w|!�;r�bO_��#�^P�e:��G�G���-�Vw�H�\�����mb��.�΄�c�T���Mro�Fj��pg��lb��y��c(Ԣ�c�Ɉ|����s��LZa���p�B "@�L�����Fhz\�w��NZ:i�m��D��5s\��|�/V�'��w2SiQqF�V���n:���,4�}&�P�n�(�Eu��NpK�Y��_��~��~ [�?��w��NT�wU	*) ��&o�/&���EL�j/���iA�ʝ�R���n:��N�gX��=Ǐ��ȵ7�ǃӬt���j_��V;�Gȝf�j΍u��l6D����M�!�o౺ ��	@�W��v�j�C�UT޿�s�ӱ����~��l9�[�zA���Y���}(��gР\I�Kr-z �5��kΑ�C������M����Ծ�Wr���z������3�]Ժ6�q}��mǣ��[_I�6�2���8CKQ[���["��H!�2��nK���F}6�*�Ф�Y
%�x���v�W�����θ\y	n-��9�U��R���r^�ڜ&m�t�^�-� "�о�I�O���d�i�"�%���wҪ�����������/B��ihi�-�����u���ř�+�@P'Z����N��d�7����0V&��g�o�*0F�8��P�dz'�?��b����+W�7������y}L�QE�O���D>�����j*��Da8}'�JTwy�J��U1����V�Ã�G�e+p��~�kLF�/�ĞHyW<t��Ju^ܣ|MT[� �E�O �Wvu55�7��N��BYw��qUZ;��U��<:ކ��7P&�-Gc����{Y�Ι{�p���"�'(�&a��\F�)lO!�,�4]�x
җ�NoAp���S����1)���c�a���g�h_�wxr�N�%�%�4>5�(�'���"g�"%hx�'kV0�4�S`eH�=�g�!�Do������m5r+^���L`�L���}���D&�p��[�Bz+?���_����!z�Nd!+A_�у�=��QוϘ`�A�ݚ4EV�I��SCr[��2?�4a��V�aU���g0	�}�ѷ;���M�D��J*���[��:|��W�
p�]�3$��c� �a��S�@Ai 1���GT��D�Z|�冇'� g+C��#�z�
i,�qB����Ƃ���+$�ؚ�[�k�N]ꌑR��"�a�d�lG�r�վS� w��$[.FI9�-?�W��o�����w�n�eD/�VS@	� ",;�Da"�"0�	����՟NT㢽���tƳ��Q��u�k����	' j0����
Q�$�"�2,Q��Z��ïiq7�Cd��� F����/BT��c?��~��މ�;Q}'��;�    �uN�G��w�i��g^���Ņ?W�u�¶��\�І��{,	���b�$ʙ0�U�l�ZvvF�P���꧛��!E��r'0O�<J���EG��d��^�MoY�/����	~���W��r�Zѻ��l�z��IT?�w�*���"��⬴|�|�j�/D�k��o�ͫ�Ru�Ff�Du��.��N�g1���X�
�V�-e���	�dFx�g�?R����Q�*�r��B�9��h�;��O��KbQ�E=��]�C+�x	n�����md�W���ʍ����8�O�76X�H1R͟Ck�9X᪑ ��5`0%t Tܠ����fϝ�I��Z���BP�%fQFh������9s��v��1�VL�u��!qy�q�ӘA�Z�d�Ϧq+jB@��$?FP��ђ�+�D"��!�bΖ#�����T��0�p��6��*0�A���%>��'�;Q�aD�On��{�ți�Y���y}�@"b�Da �#�C1 �(����JS|'��@T��9Q�dVF>� ]��Fc�)B+�LWYB���3�Z��E�*���	�L��M�W��^ ��J�"X�|�j�l���!~%�^+�~	Շ�cN�j*�jz?��ִg�L�����B��to�7�%?ǋ}y��9+$�J�绺��y`���%���a���i�N����n��|^��_㢼���Gە���P4�7
c�ء���(qt�ʳ?b����R{��8];�a���ݯq�9���I�.�8����y'"�雲����F6�"޼�t�\�n�3��Or
�6s��8/�ɺTc��#I_���X̩����
���ӗ� -[�`��͝[�%	hE�x@���6��\�`8�hwx�S]��{��-����$�8!oi���NT0Q%��}����W���B�Q��$�(��@C�$0���D����qah��m�jNE�T6����	 �=fWӨ���]�A��`���F�g��>\[�Xq��m��.Z`��뮡3��X@dຠ[I�oeK]懗������ۇs~_�PL����L/Q%`
$�4��L_�P �@$ �Y�E�qo�����w��NT�'D��3���r����"�Χ�"W�I�&����̩��O!���Ĵ,�����]7�'�~U�����4�w�_��~��~ Q�?��w��NT�wՍU]~�����­��IzLQ��>0r]���-v��L��~�fl���c�.SY��Uw��2,�Y�kt�߳�Zm]�i��+�IMf!��oO2�d�t���B��
'�/�Wj0�0��՝ޕ�g՗�)�K����Ԩ
�1>i坛���]^���tu����l}�z�jʰ*x�Kr���h�#��3R)�$K������s�
޲�W	'�9��?Qq�7������^�����b��0�P�i��.]|%��mL)O�Q��[�l:=	B3z�B��ڲb�\U�N�g/��i%��]#��;qf�O����87rGF�$b汼���T��J���C�0`�b��S�. �*��Y�������uq�:_�Y�!r��-�#��[W��>��{X�"h��W��O)���)��q#�-���8].Z�%�X�*�o
A�P���NTQE�?܊��DA�L����/��S�j�D�@@�$��G�a8�����NT���*l�QP?'��!���O��`hJ��IjZ)'���՝Ck�C���^U���\��Mә��V��W��*�ࢴRy55�s^���y%x���)l��ޔ��aD��\����nEc���Nfq�k�4*��c)�֐GB����l�Ņ!�ѫ�e���p�3�3S%9 ��v{���@���v�-en�%wFnJ�
�pA<?*D��6^@;?��R�LBVFO.���q�hK�	���%�m�N6\X/�l�B��[]/� �J���L�0�oO�,��Qrէ�ii������wf�\f��y|Tb���p�EMs�X�i��N=�E�mm�������u�������8�j���pr�KaEnȭ�G��L��,�?�>��oEymz'�?VRQ��~[#�O���8�Q���DH@0 �Q�XQDE N�JA�O$����O���.��5y�8�m7ι�p Rz����TX���.9j�N̊5U_筰������������%DH'���ƨ��s&�jd'PL[�e����,�� ���u�����U��� �@�H��P8���9�������D����O�*A���s�< 2��-��B��)L4�)L+��¼Z~
Q�ѭ�`ޟiV�a򻐼�JJ��s����{%#ӡx�������W��k��U�����p�a�<�,�'�aYgi�������I����F��2@���Za.g��%���������NP #�(�IQ���T:V�uR����	AC�К��ھ�W�#���g&�/���LZ~y�;���/r��I�@�7Cq��Lye�٤u�ZkW�|9r�B�s��Wa�Վ|U��ܼ]jT����.���ǒV��П�_U�T���������V�eV^|��_�t��v���4���Ya�Ra�Jq�B1��%�L�6`i]�/.�g�T�\����q�(�O�o��(,�� �N� r��Se=����s�!�!\�Z=y;��%���9���K(= �lɹ��k�I"݈7
��yc�zv�
��փO��Sy`W�� ���i=��V��<�Y��!>[Z����)�f���s���иR;�f��x�tؑT0���G��d�l���D��� D��3)�krmf�'�^����6~֋�4;W��my���5qmr�ݤ��K����;��F�5T0���%C�靴�0Ҋ���naҊRo��gX����T2�$ &p$���!P)�(�d��!��?���݂�=�U�?	�_#���~��*�T���U[L_��0�x΄�%>+a�r���o&�������H~hI���O�kWA����ŀ��_jWy�g��6���ǿaU�1��l+��m�8�}(�]����j�n�nŋ�ڂ���qS�·5О�N�@Z9��m���]��E�e~��x�ϫvw����QC3�e�'(��OTޤK���\��H��S�Ҹ����ŀg������=1v��,���G�����'�O^�'��'m��i��hi7N�7<�9;��X.{�Pe�a@�D5<R�1���NW��^8�e�*cx�P��M��F#�����$c�s�V<f}�}9X�L�!��})��&HA� �CJ��CS�\�"_�c�)�B��I�`�F{��8�a��-;H �@=��D·�����$NQokW�צ(i}2���(�ɷ$���z�_�~�J�0M�+��x
� B 
'@� Yt)�B����~+�ڒBW8����q�=x+�ᄋ����ӷ��ʩ-���K�p�nݚ������Cp�ʓsG"2�N���C=�Ie�c�M9��}�isɹJ9�e4Po�	�K�Ho|l����W���3�i�d�'�{��d}S| ������!�!�E %@���q�"<$p��S(	�I�;i�餵w$���C�7�	B������Y�!g&|킩��SH+���]y�Cj+7}S�����al��7B��%I�w�������;i�ǒV����aN01�	%@�Ğ0�9��w����-)O��Q�@%u���X�V�(uVg�i��<�,�~2:��$�,DF����M��M;���˩����'V!���S���� [��Y~��p�@��m�,�j�����%���n�`�L?�����(�R�'p�|��?<ki��bl�/��.
��Ik��?�K��ʬ������dU5�g���ֳ�kǉ��K���ϴf����:X�QJ٤��G�;�tҬ�'V�n�>s�A���C�@��zKe�2�q�h��S�x����DHס����bBY�I����о�,ZF�};�q& ����?�XyJ�������᫡8bdXrۣr�{�Q|��	qf�Yx���PtO����Z#pz{�#�>i�� �  -m�=���\��<�L����;� lx%3�'��)x6n}
S��A]#<��K��(8_� ��3�^0�Z���(�k�kZ~���8U��n�t9!��<'�D�E�
�	W��������U����c��A!_�(��2���GZ���
c�0iŠ7��S,���>�dE%!~�� �b8��!D`���HG�0��7�w�V��P�E��}�7�Ue��󾫶
��4"l���1j��l:��wdLn��B��@lFn�%�%4����פ�M�T`ySOP���i=�'Ϊ�T�~%�/X[�F�_w	�*����2֧�<��%_�iUݡ;��Y��Ż�;n����&]��@�{}��0�1Tx��X�Y�I\�.T��8ң�@;��X�ɵE���]ܲ}�o$��EU��+Ơ�29�ҏ�oz@5��lf��W��\<�Rz^�۴�%b�Xb��e��<؉��NO�bCG�̤����mߒ����yw��6v���_Ct�	K5�U���ζ�K��
q�MC�A5`���Ie\>Z6;1�yW:\� �mE�X����g�o��N���h�;�h���ܨٓ�Ƨ��f����]2jȆ�r�5�5���?�@�e=߿M�T�zDR?���������$����">
��{i��G�	�T@�!x�"`���5�����)�]c��Q{k7�p'��68{dϭ����ۑy�r��)���21I�wE�E"���BV���2 bS�ɚ����=M�m��A0�%���;�G�-��]���sg�`f3:b�ml�Op��T*%���j�K�����^���^�?��ݖ�t.�@L#�Be�V �l��<>F{��`Eo���#����.�mI+Q(�OWrڿ#2H*�8��$����AZ�:iͻ�S���&�
d<˸��v�¹B�8�1ޤ�>|�Z���c�:�1����.2��u�s�hc�|��,[�.I�g�������i����}{�x�[���@��#|� 䀓Mp,N�A���3ou��:ݢR����։zۨ�(�3#=N�p��� (5-B!��73$i��>Ԣ��*��,w�T�<�yg�r]�/���m�A��bl��j�/�Ƿ{)h�~!k!��E���V�_�����=��˹����^:���l�zz�� �.���2�u[��9T��T�+���3�d��C�u�6Kf���Ҿ>��h�m|4�M�FkU=�S�M9,`Cf�x�QT�ģN� �@G��E�oLϊR�$4r������\U?t̎`|.\O�7ԁ�o���x'� A�V�!�&�t`��F�u4�h�)vd�&�I���VE5 �׼�5���n�9U��/�s,�rLb�,zl���ﹾ��M���#n�:�C�bC�Ĩ>��	�<��Un�!�d�/�xi�}�G��}��j_L�s�,!�/���D%C�Yǅ���}�/�I��ޝ)�B���V�SZQ����o���h���h+�D)�� ��{E������S1N�XcP�c��OB�Oi닠�������Z��ivq�E\��1�TK����~۷�Fl밺n���R�--�N8v��A��R7�uje�j�ЧC���f)�.�s�������mub�E,&�Զl�Fm[�22]�BSrt��|�K�'�x���A�����II���T��tIr�	B�4�8�TŻ��B�����N���������Х.��册{��mu C��j�᪚s��ޑ0��x؋`Ko����:�]������l�|��8��B�\?�z�e�`b>��f�c�}�����rq���Dm���	����f=��מ�Ҳ?�feOsa{��EL>����A?�q�j�B�|���KT3p��p��F�2kY��%�G;��d	0;���@��HeK�:�AVK�
Ğ����S6W�6�Z��n�?}!�?��ס����E�_���rK|���:����!N���(~�n0�
! L�IQ�^�V��2q�=_�V���e��ÊDJ~�΃QǢ�h���R�4ص�MP�N����͡#�!I$�1�r�Ԍ�b��q�$���v���Ux �Y[[���Ⱥ6T]S����߸ź���eK��3k"�=�AH�~p2`���m}�����4�2r_"���H� H"�2
B`8�?h�m���Cq�0w�J�*jd]�)*�'Uo��EN'�g�d.�����ZQ���Cd˸�x�����H�中Α��X���%m���}A��Y���?8m�)�:2���j�4�38�A$��{�>h��L[ӂO�\	���0���:��*��R�d�6]�M��l��T��C�՜�X:�3��bT�� ޮ�����}�U8��}RZu��d���4���0A����#?��/	G߆�W���[�ZT-�y5f��F����ӠT��N3����!S৉���_���J���[UFy����s���j�{	Ϯ�֌�������������@�?/���ʬn�/�՞�q�­����(��J�@��*eS�Ɔ�PhM�侪���6�,/���A���p�Y�|k���fh/k��$8v��g�p9D�H�����v�[���
ы��6{����x�^�)�
�Z�V���6p�ai�XK����WU��|�<�ξoճ���Z\�d)Y�bm�}䘗��>�k�ժ����d���F�m']�kz���C�%p�Qy��u��:@�D0.~����tq;��D4�\���l)��y��Z}ޝ*0���ߝ)/����h+
?��YE�︷E�7��4����R�cT�D0A�y# 3
���y����4	����o,���������>�No�������"d��/���"68Yn�D'�����AϜ�ќb�����$��m��Z��:�5��x�k��QstOn�����06�0��ZE�mڋ×j�-B
s�^�uʔ|���S�戰Z;����'��ω����*�r,���z���K[V8�!-O�Y�f��p��%ҩf��z����a|��e� CfvII8ي�:�@�,��q��',����3<�����5?O�琊�������j4��
!����Լ�g�ߒ�X��&�E���,&4��F����(t���r���YS��dW0���K�1Z�L;_�t16����#�Ӹ�*%�"i�ԴZ������e�?��v!HB(�N��38�[���Q�FJ���|�b.(��|~��K>!�&������!)��K�Ӻ�%��ߺ��'I}u�?�/B����	$��
u,�w!&1 "#0G�#���Z�@(�R����i$I�sb�*Q�Ǻ��-��G���]��f2p|�ruٻw:��b#�s��8�p�^|�4���Xդ֏I+��:h@n���.�웛J�(�!�F0t4(ML��SwK`���=���s}���� N�����з�������~�zc{�      �   M   x�K��H4O5N�M5J5�51O1ѵ��4�51671571N6�0�,-N-�v�p��/H��Lсp
���2sR�b���� ���      �   j  x��[o�0���_��^�n�C�bbC�i0T�Ηԭ:��i�i�Ui$7I���w��l0�}��BHp��b<�8��qҏ#��J�A�� ���U�Q�F=EQ���vH�ݠ}DGv>�����m�:�e����1���<��wv�O���"�~�w~�e��1���ɔj�<�=�����*�~�ޜ
�SkfR��pYN����S��������&������Zvj]����
���
J����9��B���Z���k� R`u �>-�2�9�S�i�|��^�l�$
�[� ;K��\�4w���;�`�¸�����Ji�>�j�ۖ���s3���$b�8?Fੴe�)c������l��l#��%5��L�03[��+�� �R�D��.�Z7t��d3 2���B���ލ��F�0�o"�N���_Avݴz���j�b�GA@���	�\�%u�5�]*�\0rg��&·�Z��p���ъ
�2vɈ����2t��yޚ�n���(����_�1�g�\�����m��}a���5k(�P�Y���^�bqC�G(Vc��X�b��#��#|a�%����aXð�aO1윴Z�ߛM��      �   Q   x�+-N-�T1JT14R���u�H*�,It7L
tr(��sO�1)2��	�3�ɳ0�*4�t4����suK7�,����� :�?     