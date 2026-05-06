---
name: coding-standards
description: >-
  Apply ExampleApp coding standards during implementation and code review.
  Use when making code changes, refactors, follow-up fixes, or reviews
  where touched blocks must be brought up to standard for formatting,
  naming, typing, comments, architecture boundaries, validation, security,
  and performance.
tags:
  - code-quality
  - dotnet
portable-tier: 1
copilot-apply-to: "**/*.cs"
ai-inclusion: auto
---

# Coding Standards

Follow these guidelines whenever you change code or review changed code.

## Ownership Rule

If you touch a code block, own the whole block. Bring the full method, class, and comments in that touched block up to standard, not just the new lines.

## Formatting

- Use standard Visual Studio formatting.
- Use tabs to indicate control blocks and hierarchy.
- Put C# braces on their own lines.
- Put a blank line before and after control structures.
- Keep lines readable without horizontal scrolling when practical.
- Break multiline statements at logical points such as method names, dots, parameters, and operators.

## Naming

- Use PascalCase for classes, methods, enums, properties, and public members.
- Use camelCase for method arguments and private or protected members.
- Avoid abbreviations unless they are established domain terms or acronyms.
- Name booleans so they read grammatically.
- Use plural names for collections; do not append `List` or `Collection`.
- Name methods with verbs unless the method is a controller action.

## Typing

- Use strong, precise types for members, parameters, returns, and locals.
- Do not use implicitly typed locals.
- Use `bool` for true/false values.
- Use numeric types only when arithmetic is meaningful.
- Use `string` for identifiers such as phone numbers, zip codes, and similar non-arithmetic values.

## Comments

- Add XML comments to classes, enums, methods, properties, and fields in touched blocks.
- Method comments must include a grammatically correct `summary`.
- Add `param` tags for every parameter.
- Add a `returns` tag only when the method returns a value.
- Describe what is returned, not the word "returns" or just the type name.
- End comment sentences with periods.
- Do not include author, date, or change-history comments.
- Use inline comments only when the logic is genuinely non-obvious.

## Method Design

- Prefer small, reusable units of logic.
- Return method-call results directly instead of assigning them to a temporary variable and then returning the variable.
- Avoid optional parameters unless there is a strong reason.
- Keep business logic out of transport and framework types when practical.
- In newer .NET Core API projects, keep query-style extension methods chainable. Prefer returning `IQueryable<T>` for composable data access extensions instead of materializing inside the extension with `ToList()`, `ToListAsync()`, or similar terminal operations unless eager execution is the explicit goal.

## Architecture

- Keep business logic in reusable service or manager-style units, not in transport models.
- Avoid leaking MVC or HTTP transport concerns into lower layers unless the layer is explicitly responsible for transport.
- Prefer rules or configuration over hard-coded contract-specific branching.
- Keep data flow explicit through models instead of side channels.

## Validation and Security

- Validate all inputs before processing.
- Use model annotations for length, type, ranges, and patterns where applicable.
- Explicitly validate non-model inputs.
- Ensure controller actions declare explicit HTTP methods.
- Treat `GET` and `HEAD` as non-mutating operations.
- Preserve authorization and role checks where applicable.

## Exceptions

- Do not use exceptions for normal control flow.
- Avoid unnecessary `try`/`catch` blocks when higher-level handling already exists.

## Performance

- Minimize unnecessary network, service, and database calls.
- Fetch only the data needed for the unit of work.
- Avoid loading broad object graphs or result sets only to filter them in memory.

## Review Checklist

When reviewing or finalizing a change, check:

- Did the touched block get fully cleaned up?
- Do names, types, and comments follow the standards?
- Did the change keep responsibilities in the right layer?
- Did the change avoid unnecessary complexity or framework leakage?
- For newer .NET Core API projects, did new query extension methods preserve deferred execution and caller composition instead of forcing immediate materialization?
- Are validation, security, and HTTP semantics still correct?
- Did the change avoid extra round trips and unnecessary data loading?
