# SongApi

Microservicio CRUD de canciones usando Java Spring Boot y SQL Server en Docker.

## Requisitos
- Docker y Docker Compose

## Pasos para crear y levantar el proyecto

1. **Estructura y dependencias**
   - Se creó un proyecto Spring Boot con Java 17, Spring Web, Spring Data JPA y el driver de SQL Server.
   - Se agregó un Dockerfile multi-stage para compilar y ejecutar el microservicio sin requerir Maven local.
   - Se creó un `docker-compose.yml` para levantar tanto SQL Server como el microservicio juntos.
   - Se configuró la conexión a la base de datos usando variables de entorno y se añadió `trustServerCertificate=true` para evitar errores de SSL.
   - Se agregó la dependencia de Swagger UI (springdoc-openapi) para documentación y pruebas interactivas de la API.

2. **Levantar los servicios**
   - Ejecuta:
     ```sh
     docker-compose up --build -d
     ```
   - Esto levantará SQL Server en el puerto 14490 y SongApi en el puerto 8080.

3. **Inicializar la base de datos**
   - Conéctate a SQL Server en `localhost,14490` (usuario `sa`, contraseña `Politecnica1`) y ejecuta el script SQL proporcionado para crear la base y la tabla.

4. **Probar la API**
   - Accede a la documentación y pruebas interactivas en:
     - [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
   - O prueba los endpoints manualmente en Postman, Insomnia o curl:
     - `GET    /api/songs`
     - `GET    /api/songs/{id}`
     - `POST   /api/songs`
     - `PUT    /api/songs/{id}`
     - `DELETE /api/songs/{id}`

### Ejemplo de body para POST/PUT
```json
{
  "name": "Nueva Canción",
  "path": "/ruta/cancion.mp3",
  "plays": 0
}
```

---

**Autor:** Moises Arequipa