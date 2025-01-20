# Contributing Guidelines

Thank you for your interest in contributing to our project! 👍

## How to Contribute

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Commit Message Convention

Please use the following commit message format:

```
<type>: <description>
```
or with gitmoji:
```
<gitmoji> <type>: <description>
```

### Types
- `feat`: Add new feature
- `fix`: Fix a bug
- `docs`: Update documentation
- `style`: Changes that do not affect the meaning of the code (formatting, etc)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to build process or auxiliary tools

### Gitmoji (Optional, Not Strictly)
- 🎨 - Improve structure/format of the code
- ✨ - Introduce new features
- 🐛 - Fix a bug
- 📝 - Add or update documentation
- ♻️ - Refactor code
- ✅ - Add, update, or pass tests
- 🔧 - Add or update configuration files
- 🔨 - Add or update development scripts
- 🚀 - Deploy stuff
- 🔖 - Release/Version tags
- 💄 - Add or update the UI and style files
- 🔒 - Fix security issues
- 🔥 - Remove code or files
- 🐳 - Work about Docker
- 👷 - Add or update CI build system
- ⬆️ - Upgrade dependencies
- ⬇️ - Downgrade dependencies
- 🔀 - Merge branches

### Examples:
```
feat: Add user authentication
fix: Fix login validation
...
✨ feat: Add user authentication
🐛 fix: Fix login validation
📝 docs: Update README with new API endpoints
🐳 chore: Update Dockerfile base image
```

## Pull Request Guidelines

- Ensure all tests pass before submitting a PR
- Include a detailed description of changes in your PR
- Keep PRs small and focused on a single change
- Address reviewer feedback and make necessary adjustments

## Development Setup

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/REPOSITORY_NAME.git
cd REPOSITORY_NAME
```

2. Install required packages:
```bash
pip install -r requirements.txt
```

3. Make sure Docker is installed and running on your system

4. To test your changes locally:
```bash
# Build the image
docker build -t ansible-test .

# Test the image
docker run --rm ansible-test ansible --version
```

## Code Style

- Follow PEP 8 guidelines for Python code
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused

## Testing

- Add tests for new features
- Run existing tests before submitting PR:
```bash
# Run tests locally
./hello.sh
```

## Documentation

- Update documentation for new features or changes
- Keep README.md and README-ko.md in sync
- Use clear and concise language
- Include code examples where appropriate

## Questions or Issues?

- Create a new issue in the Issues tab
- Check existing issues and join the discussion
- For security issues, please email directly instead of creating a public issue

## License

By contributing to this project, you agree that your contributions will be licensed under the project's license. See [LICENSE.md](LICENSE.md) for details.
