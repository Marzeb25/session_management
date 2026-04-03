# session_management

## Docker Setup

This project uses Docker to containerize the Rails application and PostgreSQL database for easy development and deployment.

### Prerequisites

- Docker
- Docker Compose

### Running the Application

1. Build and start the containers:
   ```bash
   docker compose up --build
   ```

2. The Rails application will be available at http://localhost:3000

### Useful Commands

- Start the application: `docker compose up`
- Stop the application: `docker compose down`
- Access the Rails container bash: `docker compose exec session_app bash`
- Run Rails commands: `docker compose exec session_app bundle exec rails <command>`
- View logs: `docker compose logs`

### How it Works

- `Dockerfile.dev`: Defines the Rails application container with Ruby 4.0.2, system dependencies (build-essential, libpq-dev, nodejs), installs gems via Bundler, and runs the Rails server.
- `docker-compose.yml`: Orchestrates two services:
  - `session_app`: The Rails application with volume mounts for live code changes.
  - `db`: PostgreSQL 15 database with persistent data storage.
- Volume mounts allow for hot reloading of code changes during development.
- The app connects to the database using environment variables defined in the compose file.

### To get inside the redis
- `docker compose exec redis redis-cli`