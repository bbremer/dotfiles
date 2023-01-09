# dotfiles

## Mac setup instructions.
1. [Install homebrew](https://brew.sh/) including "Next steps" in output.
2. "echo 'alias python=python3' >> ~/.zprofile".
3. "brew reinstall python"
4. “brew install vim cmake npm iterm2 flake8”
5. Reboot.
6. "git config --global --edit"
7. Follow [Github's instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) for adding an SSH key to GitHub. Note that you need to change "*.github.com" to "*github.com" in the config file.
8. Clone this directory.
9. “cd dotfiles && sh autoinstall.sh”
