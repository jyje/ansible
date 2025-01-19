#!/bin/bash

echo "=================================================="
echo "🎉 jyje/ansible: Community Ansible Image"
echo ""
echo "Welcome to the Ansible community image! Official Ansible project does not provide"
echo "a Docker image, so this is a community-maintained project that provides a lightweight"
echo "Ansible image for Ansible users. The official Ansible project is maintained in"
echo "'ansible-community/ansible-build-data' repository."
echo ""
echo "📚 For more information:"
echo "  - This project: https://github.com/jyje/ansible"
echo "  - Official docs: https://ansible.readthedocs.io/projects/ansible-build-data"
echo "=================================================="
echo ""

echo "📦 Essential packages installed by install-essential.sh:"
echo "=================================================="
cat /install-essential.sh
echo "=================================================="
echo ""

echo "🐍 Python packages installed from requirements.txt:"
echo "=================================================="
cat /requirements.txt
echo "=================================================="
echo ""

echo "ℹ️  Installed Ansible version:"
echo "=================================================="
ansible --version
echo "=================================================="
echo ""

echo "💡 Suggested commands:"
echo "=================================================="
echo "- ansible          : Run ansible commands"
echo "- ansible-playbook : Execute ansible playbooks"
echo "- ansible-galaxy   : Manage Ansible roles and collections"
echo "=================================================="

# Keep container running
exec "$@" 
