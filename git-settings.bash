#!/bin/bash 

echo ""
echo "Configuring git settings."
echo ""

git config --global user.name "Connor Smith"
git config --global push.default simple
git config --global core.editor vim

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
