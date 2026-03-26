Skip to content
 
Search Gists
Search...
All gists
Back to GitHub
@QuantumZenoSix
QuantumZenoSix/flake.nix Secret
Last active last week
Code
Revisions
3
Clone this repository at &lt;script src=&quot;https://gist.github.com/QuantumZenoSix/0a19a34f6b7b6c51303c23f6317a06b0.js&quot;&gt;&lt;/script&gt;
<script src="https://gist.github.com/QuantumZenoSix/0a19a34f6b7b6c51303c23f6317a06b0.js"></script>
flake.nix
{
    description = "My Arch Nix Configuration";

    # ────────────────────────────────────────────────────────────────
    #  Inputs – all external sources your configuration depends on
    # ────────────────────────────────────────────────────────────────
    inputs = {

        # Where we get our packages (unstable is usually best for desktop users)
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Home Manager manages our dotfiles and user packages
        # home-manager.url = "github:nix-community/home-manager";
        home-manager = {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        # ________ EXAMPLE A: Inheriting a flake____________ 
        # A 3rd party flake for Neovim (example of inheriting from other flake)
        # kickstart-nix.url = "github:someuser/kickstart-nix-flake";


        # Example: common third-party flakes you might want
        # Uncomment / adapt as needed
        # nur.url       = "github:nix-community/NUR";
        # nixvim.url    = "github:nix-community/nixvim";
        # stylix.url    = "github:danth/stylix";               # system-wide theming
        # hyprland.url  = "github:hyprwm/Hyprland";            # if you use Hyprland
        # ags.url       = "github:aylur/ags";                  # widget system
    };


    # ────────────────────────────────────────────────────────────────
    # Outputs – what this flake actually produces
    # ────────────────────────────────────────────────────────────────
    outputs = { nixpkgs, home-manager, ... }: 

    let
        system = "x86_64-linux"; # Adjust if using ARM
        pkgs = nixpkgs.legacyPackages.${system};


    in {
	      homeConfigurations."YOURUSERNAME" = home-manager.lib.homeManagerConfiguration {
	        inherit pkgs;
	        modules = [ ./home.nix ]; # Point to our detailed config
	      };
    };
    
    # ________ EXAMPLE A: Inheriting a flake____________ 
    # outputs = { nixpkgs, home-manager, kickstart-nix, ... }: { 
        # homeConfigurations."zeno" = home-manager.lib.homeManagerConfiguration { 
        #     You can now pass 'kickstart-nix' into your home.nix as an argument! 
        #     extraSpecialArgs = { inherit kickstart-nix; }; 
        #     modules = [ ./home.nix ]; 
        # };
    #}
    
    
}
@QuantumZenoSix
Comment
 
Leave a comment
Footer
© 2026 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Community
Docs
Contact
Manage cookies
Do not share my personal information
