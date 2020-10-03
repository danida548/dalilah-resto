 dalilah-resto

//Instalacion y configuracion de la app

-> npm run install 
-> npm run migrations
-> npm run start

Dominio del server -> localhost:4444

//End points


>> Agregar usuario
    // El role del user puede ser ADMIN | USER

    [POST] /user/add
    {
        "USER_NAME": "",
        "FULL_NAME": "",
        "EMAIL": "",
        "PHONE_COUNTRY_CODE": "",
        "PHONE_NUMBER": "",
        "ADDRESS": "",
        "PASSWORD": "",
        "ROLE": "" 
    }

    [RESPUESTA] 
    {
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 15,
        "info": "",
        "serverStatus": 2,
        "warningStatus": 0
    }

>> Login (usuario)
    [POST] /user/login
    {
        "USER_NAME": "asdsa",
        "EMAIL": "dsadsa",
        "PASSWORD": "dsads"
    }

    [RESPUESTA]
    {
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTUsIlVTRVJfTkFNRSI6ImFzZHNhIiwiRU1BSUwiOiJkc2Fkc2EiLCJST0xFIjoiQURNSU4iLCJpYXQiOjE2MDA5OTMwNzB9.PomyN_NdYIdbdFuWhGtetopD8TGiyeoUV18GF08uDTg"
    }

>> Obtener listado de productos
    [GET] /productos

    [RESPUESTA] 
    [
        {
            "ID": 1,
            "PRODUCT_NAME": "TEST2",
            "PRODUCT_PRICE": 1,
            "PRODUCT_IMAGE": "https://www.ipcc.ch/site/assets/uploads/sites/3/2019/10/img-placeholder.png"
        }
    ]

>> Agregar nuevo producto

    [POST] /productos/add
    {
        "PRODUCT_NAME": "name", 
        "PRODUCT_PRICE": "11", 
        "PRODUCT_IMAGE": "https://.jpg",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTUsIlVTRVJfTkFNRSI6ImFzZHNhIiwiRU1BSUwiOiJkc2Fkc2EiLCJST0xFIjoiQURNSU4iLCJpYXQiOjE2MDA5OTMwNzB9.PomyN_NdYIdbdFuWhGtetopD8TGiyeoUV18GF08uDTg"
    }

    [RESPUESTA]
    {
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 7,
        "info": "",
        "serverStatus": 2,
        "warningStatus": 0
    }

>> Remover producto

    [POST] /productos/remove
    {
        "PRODUCT_NAME" : <condicion>, 
        "PRODUCT_PRICE" : <condicion>, 
        "PRODUCT_IMAGE" : <condicion>,
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTUsIlVTRVJfTkFNRSI6ImFzZHNhIiwiRU1BSUwiOiJkc2Fkc2EiLCJST0xFIjoiQURNSU4iLCJpYXQiOjE2MDA5OTMwNzB9.PomyN_NdYIdbdFuWhGtetopD8TGiyeoUV18GF08uDTg"
    }

    [RESPUESTA]
    {
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 0,
        "info": "",
        "serverStatus": 34,
        "warningStatus": 0
    }

>> Actualizar datos de un producto

    [POST] /productos/update
    {
        "PRODUCT_NAME" : <valor_a_actualizar>, 
        "PRODUCT_PRICE" : <valor_a_actualizar>, 
        "PRODUCT_IMAGE" : <valor_a_actualizar>
        "WHERE" : {
            "ID" : <condicion>,
            "PRODUCT_NAME" : <condicion>, 
            "PRODUCT_PRICE" : <condicion>, 
            "PRODUCT_IMAGE" : <condicion>
        }
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTUsIlVTRVJfTkFNRSI6ImFzZHNhIiwiRU1BSUwiOiJkc2Fkc2EiLCJST0xFIjoiQURNSU4iLCJpYXQiOjE2MDA5OTMwNzB9.PomyN_NdYIdbdFuWhGtetopD8TGiyeoUV18GF08uDTg"
    }

    [RESPUESTA]
    {
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 0,
        "info": "",
        "serverStatus": 34,
        "warningStatus": 0
    }

>> Obtener un pedido
    //Los admins pueden veer todos los pedidos. Los users no admins solo tienen permisos para retornar sus proprios pedidos

    [GET] /order?token<>

    [RESPUESTA]
    [
        {
            "ID": 1,
            "ESTADO": "CONFIRMADO",
            "HORA": "21:56",
            "DESCRIPCION": null,
            "PAGO": 1.4,
            "USUARIO": 11,
            "DIRECCION": null
        }
    ]

>> Crear un pedido

    [POST] /order/create
    {
        "PAGO": "11",
        "DIRECCION": "Direccion",
        "PRODUCTOS": {
            <id_del_producto> : {
                "QNT": <cantidad_de_unidades>
            },
            <id_del_producto> : {
                "QNT": <cantidad_de_unidades>
            }
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTUsIlVTRVJfTkFNRSI6ImFzZHNhIiwiRU1BSUwiOiJkc2Fkc2EiLCJST0xFIjoiQURNSU4iLCJpYXQiOjE2MDA5OTMwNzB9.PomyN_NdYIdbdFuWhGtetopD8TGiyeoUV18GF08uDTg"
    }

>> Editar un pedido

    //Los pedidos apenas aceptan los estados ('NUEVO', 'CONFIRMADO', 'PREPARANDO', 'ENVIANDO', 'CANCELADO', 'ENTREGADO')

    [POST] /order/edit
    {	
	    "ESTADO" : "CONFIRMADO",
        "DESCRIPCION" : "DESCRIPCION",
        "DIRECCION" : "DIRECCION", 
        "WHERE": {
		    "ID" : "1"
	    },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTQsIlVTRVJfTkFNRSI6IlVTRVJURVNUVFQiLCJFTUFJTCI6IlVTRVJURVNUQFVTRVJURVNULlVTRVJVU0VSVEVTVFRUVEVTVCIsIlJPTEUiOiJBRE1JTiIsImlhdCI6MTYwMDgxOTMxOH0.lS481Xro9oZ24mK2KtpEorNpydcBAqK1WXi7uCdmCRc"
    }
