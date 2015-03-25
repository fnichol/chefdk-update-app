# chefdk-update-app

A little help when you want to update an appbundled project inside [ChefDK](https://downloads.chef.io/chef-dk/).

## Requirements

* You need to have a pre-existing ChefDK installation in either `/opt/chefdk` (for Unix-like distros) or `%SYSTEMDRIVE%\opscode\chefdk` (for Windows distros).
* You need to have the `git` command in your PATH.
* You need patience if this doesn't work out of the box every time :)

## Usage

Clone this repository with and enter the project directory:

```sh
git clone https://github.com/fnichol/chefdk-update-app.git
cd chefdk-update-app
```

Choose a ChefDK "app" to update. If you don't need a list of options, run the help command.

For Unix distros:

```sh
./bin/chefdk-update-app.sh --help
```

For Windows distros from PowerShell:

```powershell
& bin\chefdk-update-app.bat --help
```

Choose a Git reference to update your app to. This could be a branch name, tag, SHA hash, or even `"master"`.

Run it!

For example, to update the `"test-kitchen"` app to release `"v1.4.0.beta.2"` (note that this project puts a `"v"` in front of release tags),

For Unix distros:

```sh
sudo -E ./bin/chefdk-update-app.sh test-kitchen -r v1.4.0.beta.2
```

For Windows distros from PowerShell:

```powershell
& bin\chefdk-update-app.bat test-kitchen -r v1.4.0.beta.2
```

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE.txt][license])

[license]:      https://github.com/fnichol/chefdk-update-app/blob/master/LICENSE.txt
[fnichol]:      https://github.com/fnichol
[repo]:         https://github.com/fnichol/chefdk-update-app
[issues]:       https://github.com/fnichol/chefdk-update-app/issues
