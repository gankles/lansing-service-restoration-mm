# Project Structure Guidelines

## Repository Root Structure
This repository should maintain a flat structure with all project files in the root directory:

```
lansing-service-restoration-mm/
├── .dockerignore
├── .eslintrc.json
├── .gitignore
├── Dockerfile
├── Dockerfile.dev
├── README.md
├── app/
├── docker-compose.yml
├── docker-compose.prod.yml
├── nginx.conf
├── package.json
├── scripts/
└── ... (other config files)
```

## What NOT to do:
❌ Create nested project directories like:
- `lansing-service-restoration-mm/lansing-service-restoration-mm/`
- `project/src/project/`
- Multiple clone directories

## Best Practices:
✅ Keep all configuration files in root
✅ Use the existing `app/` directory for Next.js pages
✅ Use `scripts/` for deployment and development scripts
✅ Maintain Docker files in root for easy access

## Development Setup:
1. Clone repository
2. Run `npm install` in root directory
3. Use `npm run docker:dev` for development
4. Use `npm run docker:prod` for production

## If you accidentally create nested directories:
1. Move all files to root: `mv nested-dir/* .`
2. Remove empty directory: `rmdir nested-dir`
3. Commit changes: `git add . && git commit -m "Fix: flatten directory structure"`