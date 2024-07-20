# Supabase CLI Setup and Usage Guide 

## 🟩 Installing the Supabase CLI 🟩

### macOS
```sh
brew install supabase/tap/supabase
```

### Windows
Install the CLI with Scoop:
```sh
scoop bucket add supabase https://github.com/supabase/scoop-bucket.git
scoop install supabase
```

----

### 🟩 Docker Installation [Mandatory] 🟩
The Supabase CLI uses Docker containers to manage the local development stack. Make sure you have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed.

----

## 🟩 Running Supabase Locally 🟩

**Short Command Snippets:  ```supabase [init, start, stop]```**

1. **Initialize the Supabase Project**
   Inside the folder where you want to create your project, run:
   ```sh
   supabase init
   ```
   This will create a new `supabase` folder. It's safe to commit this folder to your version control system.

2. **Start the Supabase Stack**
   To start the Supabase stack, run:
   ```sh
   supabase start
   ```
   The local development environment includes Supabase Studio, a graphical interface for working with your database, running by default on `localhost:54323`.

3. **Stopping Local Services**
   When you are finished working on your Supabase project, you can stop the stack with:
   ```sh
   supabase stop
   ```


**Reference:** [Supabase CLI Guide](https://supabase.com/docs/guides/cli/getting-started?queryGroups=platform&platform=macos)

---

## 🟩 Supabase Version Control Using GitHub 🟩

**Command Shortcut snippets:** ```supabase [init, login, link, pull, start]```

### Managing Environments with Supabase CLI

1. **Initialize the Supabase Project**
   ```sh
   supabase init
   ```
   You should see a new `supabase` directory.

2. **Login to Supabase**
   ```sh
   supabase login
   ```

3. **Link Local Repository with Supabase Project**
   ```sh
   supabase link --project-ref $PROJECT_ID
   ```
   Replace `$PROJECT_ID` with your actual project ID from ```(https://supabase.com/dashboard/project/<project-id>)```

4. **Pull Remote Schema Changes**
   Before making local schema changes from the CLI, pull the latest changes:
   ```sh
   supabase db pull
   ```
   This command creates a new migration in `supabase/migrations/<timestamp>_remote_schema.sql` which reflects the schema changes you have made previously.

5. **Create a Migration File**
   ```sh
   supabase migration new cicd_test
   ```
   This will create a file inside the migration folder.

6. **Enter Schema Details**
   - Create a table using the local GUI.
   - Generate the schema:
     ```sh
     supabase db diff -f new_employee
     ```
   - Copy the schema and paste it into the migration file.

7. **Setup GitHub Workflows**
   - Setup `ci.yaml`, `production.yaml`, `staging.yaml`.
   - Add access tokens and project tokens in the GitHub secrets.
   - Set `main` (production), `master` (staging).

8. **Verify Workflows**
   - Ensure the workflows are working correctly.
   - Once verified, repeat steps 5 & 6 and push your code to the `master` (staging) branch.

  
**Reference:** [Managing Environments with Supabase CLI](https://supabase.com/docs/guides/cli/managing-environments?queryGroups=environment&environment=production)
