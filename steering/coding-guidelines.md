# Example Organization Coding Guidelines Integration

## Purpose
This document defines when and how to load Example Organization-specific coding guidelines based on project type, programming language, framework, and architecture patterns. These guidelines ensure consistency across all Example Organization development projects.

## MANDATORY: Guidelines Loading Strategy

### Project Detection and Guidelines Selection

**ALWAYS execute at project start or when technology stack is identified:**

1. **Detect Project Characteristics**:
   - Programming language(s)
   - Framework(s) and versions
   - Project type (API, web app, console, etc.)
   - Architecture pattern
   - Target deployment environment

2. **Load Applicable Guidelines**:
   - Load ALL relevant guideline documents
   - Apply guidelines in order of specificity (general → specific)
   - Validate compatibility between multiple guidelines

## Guidelines Directory Structure

```text
$env:USERPROFILE\personal-engineering-standards\standards\
├── general/
│   ├── coding-standards.md           # Universal coding standards
│   ├── security-practices.md         # Security requirements
│   ├── testing-standards.md          # Testing approaches
│   ├── documentation-standards.md    # Documentation requirements
│   └── deployment-practices.md       # Deployment guidelines
├── dotnet/
│   ├── dotnet-general.md            # .NET general guidelines
│   ├── dotnet-rest-api-guidelines.md # REST API specific
│   ├── dotnet-web-app-guidelines.md # Web applications
│   ├── dotnet-console-app-guidelines.md # Console applications
│   ├── dotnet-background-worker-guidelines.md # Background services
│   └── dotnet-nuget-packages.md     # NuGet package standards
├── angular/
│   ├── angular-general.md           # Angular general guidelines
│   ├── angular-component-guidelines.md # Component standards
│   ├── angular-service-guidelines.md # Service patterns
│   ├── angular-routing-guidelines.md # Routing standards
│   └── angular-testing-guidelines.md # Angular testing
├── javascript/
│   ├── javascript-general.md        # JavaScript standards
│   ├── typescript-guidelines.md     # TypeScript specific
│   └── node-js-guidelines.md       # Node.js applications
├── database/
│   ├── sql-server-guidelines.md     # SQL Server standards
│   ├── entity-framework-guidelines.md # EF Core patterns
│   └── database-design-guidelines.md # Database design
├── cloud/
│   ├── azure-guidelines.md          # Azure deployment
│   ├── docker-guidelines.md         # Containerization
│   └── kubernetes-guidelines.md     # Kubernetes deployment
└── architecture/
    ├── microservices-guidelines.md  # Microservices patterns
    ├── monolith-guidelines.md       # Monolithic applications
    ├── clean-architecture-guidelines.md # Clean Architecture
    └── domain-driven-design-guidelines.md # DDD patterns
```

## Loading Rules by Project Type

### .NET Projects

**ALWAYS Load**:
- `general/coding-standards.md`
- `general/security-practices.md`
- `general/testing-standards.md`
- `dotnet/dotnet-general.md`

**Load for New Project Creation**:
- `dotnet/dotnet-project-structure.md`

**Load Based on Project Type**:

#### REST API Projects
```markdown
**Detection Criteria**:
- Contains Controllers with API attributes
- Has Swagger/OpenAPI configuration
- Web API project template

**Additional Guidelines**:
- `dotnet/dotnet-rest-api-guidelines.md`
- `general/documentation-standards.md` (API documentation section)
- `database/entity-framework-guidelines.md` (if using EF)
```

#### Web Applications (MVC/Razor Pages)
```markdown
**Detection Criteria**:
- Contains Views or Razor Pages
- MVC or Razor Pages project template
- Has UI components

**Additional Guidelines**:
- `dotnet/dotnet-web-app-guidelines.md`
- `general/documentation-standards.md` (UI documentation section)
```

#### Console Applications
```markdown
**Detection Criteria**:
- Console application project template
- Has Program.cs with console entry point
- No web-related dependencies

**Additional Guidelines**:
- `dotnet/dotnet-console-app-guidelines.md`
- `general/deployment-practices.md` (console deployment section)
```

#### Background Workers/Services
```markdown
**Detection Criteria**:
- Inherits from BackgroundService
- Has hosted service configuration
- Worker service project template

**Additional Guidelines**:
- `dotnet/dotnet-background-worker-guidelines.md`
- `general/deployment-practices.md` (service deployment section)
```

#### NuGet Package Projects
```markdown
**Detection Criteria**:
- Has PackageReference for packaging
- Contains .nuspec file
- Library project intended for distribution

**Additional Guidelines**:
- `dotnet/dotnet-nuget-packages.md`
- `general/documentation-standards.md` (package documentation section)
```

### Angular Projects

**ALWAYS Load**:
- `general/coding-standards.md`
- `general/security-practices.md`
- `general/testing-standards.md`
- `angular/angular-general.md`
- `javascript/typescript-guidelines.md`

**Additional Guidelines**:
- `angular/angular-component-guidelines.md`
- `angular/angular-service-guidelines.md`
- `angular/angular-routing-guidelines.md`
- `angular/angular-testing-guidelines.md`

### JavaScript/Node.js Projects

**ALWAYS Load**:
- `general/coding-standards.md`
- `general/security-practices.md`
- `general/testing-standards.md`
- `javascript/javascript-general.md`

**Load Based on Technology**:
- TypeScript: `javascript/typescript-guidelines.md`
- Node.js: `javascript/node-js-guidelines.md`

### Database Projects

**Load Based on Database Technology**:
- SQL Server: `database/sql-server-guidelines.md`
- Entity Framework: `database/entity-framework-guidelines.md`
- Database Design: `database/database-design-guidelines.md`

### Cloud and Deployment

**Load Based on Deployment Target**:
- Azure: `cloud/azure-guidelines.md`
- Docker: `cloud/docker-guidelines.md`
- Kubernetes: `cloud/kubernetes-guidelines.md`

### Architecture Patterns

**Load Based on Architecture**:
- Microservices: `architecture/microservices-guidelines.md`
- Monolith: `architecture/monolith-guidelines.md`
- Clean Architecture: `architecture/clean-architecture-guidelines.md`
- Domain-Driven Design: `architecture/domain-driven-design-guidelines.md`

## Implementation Workflow

### 1. Project Analysis Phase
```markdown
**Execute during Workspace Detection or Requirements Analysis**:


**For New Projects - Ask Discovery Questions First**:
Before starting AI-DLC process, gather project requirements:

- What type of project? (REST API, Background Worker, Console App, Web App, NuGet Package, etc.)
- Will this project use a database?
  - If yes: Does it connect to the ExampleApp Database?
  - If no ExampleApp: Does it have its own database?
  - If own database: What type? (PostgreSQL, DynamoDB, SQL Server, other)
- Target deployment environment? (AWS - default for all new projects)

Use responses to determine which guidelines to load.

**For Existing Projects - Scan Project Structure**:
1. **Scan Project Structure**:
   - Identify project files (.csproj, package.json, angular.json)
   - Analyze dependencies and frameworks
   - Detect architecture patterns
   - Identify deployment configurations

2. **Determine Guidelines to Load**:
   - Map detected technologies to guideline files
   - Create loading plan with priority order
   - Validate guideline compatibility

3. **Load Guidelines**:
   - Load general guidelines first
   - Load technology-specific guidelines
   - Load architecture-specific guidelines
   - Load deployment-specific guidelines
```

### 2. Guidelines Application
```markdown
**Apply throughout all workflow phases**:

1. **During Design Phases**:
   - Reference architecture guidelines
   - Apply design patterns from guidelines
   - Validate design decisions against standards

2. **During Code Generation**:
   - Apply coding standards and conventions
   - Use approved libraries and packages
   - Follow security practices
   - Implement testing patterns

3. **During Build and Test**:
   - Apply testing standards
   - Use approved build processes
   - Follow deployment practices
```

### 3. Validation and Compliance
```markdown
**Validate compliance throughout workflow**:

1. **Code Review Checklist**:
   - Generate checklist from applicable guidelines
   - Validate against coding standards
   - Check security compliance
   - Verify testing coverage

2. **Architecture Review**:
   - Validate against architecture guidelines
   - Check pattern implementation
   - Verify dependency management

3. **Deployment Readiness**:
   - Validate deployment configuration
   - Check security requirements
   - Verify monitoring and logging
```

## Loading Priority Order

1. **General Guidelines** (Always first)
2. **Language-Specific Guidelines** (e.g., .NET, JavaScript)
3. **Framework-Specific Guidelines** (e.g., Angular, ASP.NET Core)
4. **Project-Type Guidelines** (e.g., REST API, Console App)
5. **Architecture Guidelines** (e.g., Clean Architecture, Microservices)
6. **Deployment Guidelines** (e.g., Azure, Docker)

## Conflict Resolution

**When guidelines conflict**:
1. **More specific guidelines override general ones**
2. **Project-type guidelines take precedence over language guidelines**
3. **Architecture guidelines override framework guidelines for structural decisions**
4. **Security guidelines always take highest priority**

## Integration with AI-DLC Workflow

### Inception Phase Integration
```markdown
**Workspace Detection**:
- Add guideline detection to workspace analysis
- Log applicable guidelines in aidlc-state.md

**Requirements Analysis**:
- Reference guidelines when analyzing requirements
- Validate requirements against standards

**Application Design**:
- Apply architecture guidelines
- Use approved design patterns
```

### Construction Phase Integration
```markdown
**Functional Design**:
- Apply domain modeling guidelines
- Use approved business logic patterns

**NFR Requirements**:
- Reference performance guidelines
- Apply security requirements

**Code Generation**:
- Apply all relevant coding guidelines
- Use approved libraries and frameworks
- Follow testing standards
```

## Mandatory Loading Rules

**CRITICAL**: When performing any phase, you MUST read and use relevant content from rule detail files in `$env:USERPROFILE\personal-engineering-standards\standards\`.

### CRITICAL: Always Load These Guidelines
```markdown
**For ANY Example Organization project**:
- `general/coding-standards.md`
- `general/security-practices.md`
- `general/testing-standards.md`

**Additional loading based on detected technologies**
**NEVER skip applicable technology-specific guidelines**
```

### CRITICAL: Validation Requirements
```markdown
**Before any code generation**:
1. Validate all applicable guidelines are loaded
2. Check for conflicting requirements
3. Resolve conflicts using priority order
4. Document any deviations with justification
```

## Example Loading Scenarios

### Scenario 1: .NET REST API with Entity Framework
```markdown
**Detected Technologies**:
- .NET 8
- ASP.NET Core Web API
- Entity Framework Core
- SQL Server
- Docker deployment

**Guidelines to Load**:
1. general/coding-standards.md
2. general/security-practices.md
3. general/testing-standards.md
4. dotnet/dotnet-general.md
5. dotnet/dotnet-rest-api-guidelines.md
6. database/entity-framework-guidelines.md
7. database/sql-server-guidelines.md
8. cloud/docker-guidelines.md
9. architecture/clean-architecture-guidelines.md (if detected)
```

### Scenario 2: Angular Frontend Application
```markdown
**Detected Technologies**:
- Angular 17
- TypeScript
- RxJS
- Angular Material
- Azure deployment

**Guidelines to Load**:
1. general/coding-standards.md
2. general/security-practices.md
3. general/testing-standards.md
4. javascript/typescript-guidelines.md
5. angular/angular-general.md
6. angular/angular-component-guidelines.md
7. angular/angular-service-guidelines.md
8. angular/angular-routing-guidelines.md
9. angular/angular-testing-guidelines.md
10. cloud/azure-guidelines.md
```

### Scenario 3: Console Application with Background Processing
```markdown
**Detected Technologies**:
- .NET 8
- Console Application
- Background Services
- Entity Framework Core
- Docker deployment

**Guidelines to Load**:
1. general/coding-standards.md
2. general/security-practices.md
3. general/testing-standards.md
4. dotnet/dotnet-general.md
5. dotnet/dotnet-console-app-guidelines.md
6. dotnet/dotnet-background-worker-guidelines.md
7. database/entity-framework-guidelines.md
8. cloud/docker-guidelines.md
```

## Maintenance and Updates

### Guideline Versioning
- Guidelines should be versioned
- Projects should reference specific guideline versions
- Updates should be backward compatible when possible

### Regular Reviews
- Guidelines should be reviewed quarterly
- Updates based on technology changes
- Feedback from development teams
- Industry best practice evolution

This ensures all Example Organization projects follow consistent, up-to-date coding standards while adapting to the specific technologies and patterns used in each project.
