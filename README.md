## Team Roles

This project involves a multidisciplinary software development team. Below are the roles and their responsibilities:

### Business Analyst (BA)
- Understands the client’s business processes and needs.
- Translates customer requirements into technical documentation.
- Acts as a bridge between stakeholders and the development team.
- Ensures business value is delivered by aligning technical outputs with client expectations.

### Product Owner (PO)
- Owns and defines the product vision and roadmap.
- Maintains and prioritizes the product backlog.
- Balances stakeholder needs with user feedback and market trends.
- Ensures the final product aligns with business objectives.

### Project Manager (PM)
- Oversees project timelines, scope, and budget.
- Coordinates task assignments and resource planning.
- Facilitates communication across the team and resolves blockers.
- Ensures successful delivery within Agile or traditional frameworks.

### UI/UX Designer
- Designs user flows, wireframes, and prototypes.
- Ensures the product is intuitive, accessible, and user-friendly.
- Conducts user research and usability testing.
- Collaborates closely with frontend developers.

### Software Architect
- Designs the high-level system structure and integration patterns.
- Selects the appropriate tech stack and tools.
- Sets code quality standards and performs reviews.
- Solves complex architectural and performance issues.

### Backend Developer
- Builds and maintains server-side logic, RESTful APIs, and business logic.
- Integrates external services and manages data flow.
- Implements authentication, authorization, and security protocols.
- Collaborates with the architect and frontend team to ensure feature completeness and performance.

### Frontend Developer
- Develops user interfaces using modern frameworks (e.g., React).
- Connects with backend APIs to deliver full-stack functionality.
- Ensures mobile responsiveness and cross-browser compatibility.

### Quality Assurance (QA) Engineer
- Verifies that the application meets all functional and non-functional requirements.
- Performs manual testing and documents results.
- Identifies bugs and usability issues early in the cycle.

### Test Automation Engineer
- Builds and maintains automated testing scripts.
- Implements a reliable and maintainable test framework.
- Enhances test coverage and reduces testing time with automation.

### DevOps Engineer
- Implements CI/CD pipelines for continuous delivery.
- Manages cloud infrastructure and deployment environments.
- Monitors system health and manages incident response.
- Bridges development and operations for faster, stable delivery.

## Technology Stack

The following technologies are used in the Airbnb Clone Project. Each tool plays a specific role in achieving functionality, performance, and scalability.

### Django
A high-level Python web framework used for building the backend of the application. It handles routing, request handling, ORM-based database access, authentication, and overall server-side logic.

### Django REST Framework (DRF)
An extension of Django used to build RESTful APIs. It simplifies serialization, authentication, and API views, making it easier to create and manage API endpoints.

### PostgreSQL
A powerful, open-source relational database used to store structured data such as user profiles, listings, reservations, reviews, and payments. It is known for its reliability and support for advanced querying.

### Celery
A task queue used for handling asynchronous operations such as sending emails, processing payments, and running background tasks.

### Redis
Used as a message broker for Celery and also for caching purposes. Redis improves performance by storing frequently accessed data in-memory.

### Docker
A containerization tool used to package the application and its dependencies into isolated environments. It ensures consistency across development, testing, and production.

### Nginx
A high-performance web server and reverse proxy used to serve static files and forward requests to the Django application running on a WSGI server.

### Gunicorn
A Python WSGI HTTP server used to run the Django application in production. It handles incoming requests and communicates with Django to return responses.

### Git & GitHub
Version control and collaboration tools. Git tracks code changes, while GitHub hosts the repository and enables team collaboration through branches and pull requests.

