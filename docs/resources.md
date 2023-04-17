## ER Diagram

```mermaid
erDiagram
    ORGANIZATION ||--|{ USER : has
    ORGANIZATION ||--|{ TEAM : has
    USER ||--|{ USER-ROLE: has
    USER-ROLE }|--|| ROLE: role
    TEAM ||--|{ TEAM-USER : has
    TEAM-USER }|--|| USER: user
    TEAM ||--|{ TEAM-REPORT : has
    TEAM-REPORT ||--|{ USER-REPORT : has
    USER-REPORT }|--|| USER : user
```
