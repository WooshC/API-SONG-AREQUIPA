# SongApi

## Objetivo
El objetivo de este proyecto es validar los conocimientos adquiridos para desarrollar un microservicio que realice operaciones CRUD sobre una tabla de canciones, utilizando Java Spring Boot y SQL Server, y su despliegue mediante contenedores Docker.

## Materiales y recursos
- Computador con acceso a Internet
- IDE de preferencia (Eclipse, IntelliJ IDEA, VS Code, etc.)
- Navegador web moderno
- Postman, Insomnia o cualquier herramienta para probar los endpoints

## Requerimientos generales
1. **Operaciones CRUD:**
   - Crear, leer, actualizar y eliminar canciones sobre la tabla `TBL_SONG`.
   - Campos requeridos: `Id` (identificador único), `Name` (nombre de la canción), `Path` (ruta o URL), `Plays` (número de reproducciones).
2. **Lenguaje:**
   - Java 17 con Spring Boot (puedes usar cualquier lenguaje excepto C#).
3. **Base de datos:**
   - SQL Server (puedes usar cualquier base de datos relacional o NoSQL).

## Configuración inicial
- **Lenguaje:** Java 17
- **Framework:** Spring Boot, Spring Web, Spring Data JPA
- **Base de datos:** SQL Server 2022 (en contenedor Docker)
- **Documentación interactiva:** Swagger UI (springdoc-openapi)
- **Contenedores:** Docker y Docker Compose

## Clonar el repositorio

```sh
git clone https://github.com/WooshC/API-SONG-AREQUIPA.git
cd API-SONG-AREQUIPA
```

## Despliegue con Docker

1. **Levantar los servicios:**
   - Ejecuta:
     ```sh
     docker-compose up --build -d
     ```
   - Esto levantará SQL Server en el puerto 14490 y SongApi en el puerto 8080.
   - El script de inicialización de la base de datos se ejecuta automáticamente al iniciar el contenedor.

2. **Verifica el estado:**
   - Puedes ver los logs con:
     ```sh
     docker logs sqlserver_songapi
     docker logs <nombre_del_contenedor_db-init>
     docker logs <nombre_del_contenedor_songapi>
     ```

## Probar la API
- Accede a la documentación y pruebas interactivas en:
  - [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
- O prueba los endpoints manualmente en Postman, Insomnia o curl:

| Método | Endpoint           | Descripción                |
|--------|--------------------|----------------------------|
| GET    | /api/songs         | Obtener todas las canciones|
| GET    | /api/songs/{id}    | Obtener una canción por ID |
| POST   | /api/songs         | Crear una nueva canción    |
| PUT    | /api/songs/{id}    | Actualizar una canción     |
| DELETE | /api/songs/{id}    | Eliminar una canción       |

### Ejemplo de body para POST/PUT
```json
{
  "name": "Nueva Canción",
  "path": "/ruta/cancion.mp3",
  "plays": 0
}
```

## Pruebas del microservicio
Una vez publicado el microservicio, realiza pruebas utilizando Postman, Insomnia o la herramienta de tu preferencia. Captura pantallas de las pruebas exitosas que demuestren el correcto funcionamiento de los siguientes endpoints:
- **GET** - Consulta de canciones
- **POST** - Crear canciones
- **PUT**/**PATCH** - Actualizar una canción
- **DELETE** - Eliminar una canción

Las capturas deben mostrar la URL del endpoint, el método HTTP, el body de la petición (cuando aplique) y la respuesta exitosa (código de estado 200, 201, etc.).

## Documentación técnica
1. **Configuración inicial:** Herramientas, lenguajes, bibliotecas y frameworks utilizados.
2. **Desarrollo:**
   - Explicación del código fuente paso a paso.
   - Capturas de pantalla y comandos clave utilizados.
3. **Pruebas funcionales:** Demuestra el funcionamiento local de las operaciones CRUD mediante herramientas como Postman o Insomnia.
4. **Despliegue:**
   - Explicación de cómo se realizó el despliegue (contenedorizado o en la nube).
   - Incluye capturas de pantalla del microservicio en funcionamiento en el entorno de despliegue.

## Publicar en Docker Hub

1. **Inicia sesión en Docker Hub:**
   ```sh
   docker login
   ```
2. **Construye la imagen:**
   ```sh
   docker build -t <tu_usuario>/songapi:latest .
   ```
3. **Sube la imagen a Docker Hub:**
   ```sh
   docker push <tu_usuario>/songapi:latest
   ```
4. **(Opcional) Usa la imagen en la nube:**
   - Puedes usar la imagen publicada en Docker Hub para desplegar en Azure, AWS, GCP, etc.

---

**Autor:** Moises Arequipa