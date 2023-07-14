# Elixir Development Environment

1. Search the packages on [nixos.org](https://search.nixos.org/packages).

2. Find the right version (possibly in unstable).

3. Go to the package's Source.

4. Find the commit hash of the version you want to use. If you want to 'tweak' the version or look at what is available it is sometimes worth going to the file's parent folder and remember to look at the file's commit history if you want a specific, earlier version.

5. Insert it into the shell.nix file.

## Check Versions

`elixir --version`

`erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().' -noshell`

