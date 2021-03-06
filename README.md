# Todo API

<br>

## Headers
<br>

Content-Type always required.
```
--header 'Content-Type: application/json'
```
Authorization required for most endpoints.
```
--header 'Authorization: token'
```

---
<br>

## Endponts
<br>

### Token
- New token: GET /key/new

<br>

### Users

<br>

- Create: POST /users
  - takes params
  ```
  {
    "user": {
      "handle": "required, limit 50 characters",
      "name": "required, limit 50 characters",
      "email": "required, limit 255 characters",
      "password": "required, limit 140 characters",
      "password_confirmation": "required, limit 140 characters"
    }
  }
  ```

<br>

- Index: GET /users
  - Requires valid token in header.

<br>

- Show: GET /users/user_id
  - user_id = the users id.
  - Requires valid token in header.

<br>

- Edit: PATCH /users/ID
  - ID = the users id.
  - Requires the token belonging to the user in header.
  - takes some or all of these params.

  ```
  {
    "user": {
      "handle": "User",
      "name": "userName",
      "email": "user@example.com",
      "password": "foobar",
      "password_confirmation": "foobar"
    }
  }
  ```

<br>

- Delete: DELETE /users/user_id
  - user_id = the users id.
  - Requires the token belonging to the user in header.
  
  <br>

### Teams

<br>

- Create: POST /teams
  - Requires valid token in header.
  - takes params
  ```
  {
    "team": {
      "name": "required, limit 50 characters",
      "description": "limit 140 characters"
    }
  }
  ```

<br>

- Index: GET /teams
  - Requires valid token in header.

<br>

- Show: GET /teams/team_id
  - team_id = the teams id.
  - Requires valid token in header.

<br>

- Edit: PATCH /teams/ID
  - ID = the teams id.
  - Requires the token belonging to the team owner in header.
  - takes some or all of these params.

  ```
  {
    "team": {
      "name": "A fantastic team name",
      "description": "a short-ish description of the team"
    }
  }
  ```

<br>

- Delete: DELETE /teams/team_id
  - team_id = the teams id.
  - Requires the token belonging to the team owner in header.
    
  <br>

### Projects

<br>

- Create: POST /team/team_id/projects
  - team_id = the teams id.
  - Requires valid token in header.
  - Requires team to exist.
  - takes params
  ```
  {
    "project": {
      "name": "required, limit 50 characters",
      "description": "limit 140 characters",
      "requirements": "limit 500 characters, can be stringified json"
    }
  }
  ```

<br>

- Index: GET /teams/team_id/projects
  -  team_id = the teams id.
  - Requires valid token in header.

<br>

- Show: GET /teams/team_id/projects/project_id
  - team_id = the teams id.
  - project_id = the project id.
  - Requires valid token in header.

<br>
  
- Edit: PATCH /teams/team_id/projects/project_id
  - team_id = the teams id.
  - project_id = the project id.
  - Requires the token belonging to the team owner in header.
  - takes some or all of these params.

  ```
  {
    "project": {
      "name": "A cool name for the project",
      "description": "a short-ish description of the project goals",
      "requirements": "[\"does stuff\", \"must not do certain stuff\", \"does more stuff\" ]"
    }
  }
  ```

<br>

- Delete: DELETE /teams/team_id/projects/project_id
  - team_id = the teams id.
  - project_id = the project id.
  - Requires the token belonging to the team owner in header.

<br>

### Tasks

<br>

- Create: POST /team/projects/project_id/tasks
  - team_id = the teams id.
  - project_id = the projects id.
  - Requires valid token in header.
  - Requires team and project to exist.
  - takes params
  ```
  {
    "task": {
      "name": "required, limit 50 characters",
      "description": "limit 240 characters",
      "completed": "boolean, false by default",
      "duedate": "datetime, null by default",
      "completed_at": "datetime, null by default"
    }
  }
  ```

<br>
  
- Index: GET /teams/team_id/projects/project_id/tasks
  - team_id = the teams id.
  - project_id = the projects id.
  - Requires valid token in header.

<br>
  
- Show: GET /teams/team_id/projects/project_id/tasks/task_id
  - team_id = the teams id.
  - project_id = the project id.
  - task_id = the tasks id.
  - Requires valid token in header.

<br>
  
- Edit: PATCH /teams/team_id/projects/project_id/tasks/task_id
  - team_id = the teams id.
  - project_id = the project id.
  - task_id = the tasks id.
  - Requires the token belonging to the team owner in header.
  - takes some or all of these params.

  ```
  {
    "task": {
      "name": "A name that accurately sums up the task",
      "description": "A descriptive description describing the task at hand",
      "completed": true,
      "duedate": ""2022-05-05T22:19:32.473Z",
      "completed_at": "2022-03-05T22:19:32.473Z"
    }
  }
  ```

<br>
  
- Delete: DELETE /teams/team_id/projects/project_id/tasks/task_id
  - team_id = the teams id.
  - project_id = the project id.
  - task_id = the tasks id.
  - Requires the token belonging to the team owner in header.


### Membership requests

<br>

#### User routes

- Create: POST /users/user_id/requests

  - This is used by a team owner to send a request to a user

  - user_id = the users id
  - takes params
  ```
  {
    "user": {
      "team_id": "required, integer team id, team must exist, and you must be the owner"
    }
  }
  ```

<br>

- Index: GET /users/user_id/requests.
  - user_id = the users id.
  - Requires valid token in header.

<br>

- Show: GET /users/user_id/requests/request_id
  - user_id = the users id.
  - request_id = the requests id.
  - Requires valid token in header.

<br>

- Delete: DELETE /users/user_id/requests/request_id
  - user_id = the users id.
  - request_id = the requests id.
  - Requires the token belonging to the user in header.
  - user must be the sender of the request.
  
<br>

- Accept: PATCH /users/user_id/requests/request_id/accept
  - user_id = the users id.
  - request_id = the requests id.
  - Requires the token belonging to the user in header.
  - user must be the recipient of the request.
  
<br>

- Reject: PATCH /users/user_id/requests/request_id/reject
  - user_id = the users id.
  - request_id = the requests id.
  - Requires the token belonging to the user in header.
  - user must be the recipient of the request.
  
<br>

#### Team routes

- Create: POST /teams/team_id/requests
  - This is used by a user to send a request to a team
  - team_id = the teams id.

<br>

- Index: GET /teams/team_id/requests.
  - team_id = the teams id.
  - Requires valid token in header.

<br>

- Show: GET /teams/team_id/requests/request_id
  - team_id = the teams id.
  - request_id = the requests id.
  - Requires valid token in header.

<br>

- Delete: DELETE /teams/team_id/requests/request_id
  - team_id = the teams id.
  - request_id = the requests id.
  - Requires the token belonging to the team owner in header.
  - team must be the sender of the request.

<br>

- Accept: PATCH /teams/team_id/requests/request_id/accept
  - team_id = the teams id.
  - request_id = the requests id.
  - Requires the token belonging to the team owner in header.
  - team must be the recipient of the request.

<br>

- Reject: PATCH /teams/team_id/requests/request_id/reject
  - team_id = the teams id.
  - request_id = the requests id.
  - Requires the token belonging to the team owner in header.
  - team must be the recipient of the request.

<br>