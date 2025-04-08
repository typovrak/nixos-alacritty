# nixos-alacritty

nixos-alacritty = fetchGit {
	url = "https://github.com/typovrak/nixos-alacritty.git";
	ref = "main";
};

(import "${nixos-alacritty}/configuration.nix")
