{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.alacritty = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/alacritty
		mkdir ${home}/.config/alacritty
		chown ${username}:${group} ${home}/.config/alacritty
		chmod 700 ${home}/.config/alacritty

		cp ${./alacritty.toml} ${home}/.config/alacritty/alacritty.toml
		chown ${username}:${group} ${home}/.config/alacritty/alacritty.toml
		chmod 600 ${home}/.config/alacritty/alacritty.toml

		cp ${./catppuccin-mocha.toml} ${home}/.config/alacritty/catppuccin-mocha.toml
		chown ${username}:${group} ${home}/.config/alacritty/catppuccin-mocha.toml
		chmod 600 ${home}/.config/alacritty/catppuccin-mocha.toml
	'';

	environment.systemPackages = with pkgs; [
		alacritty
	];
}
