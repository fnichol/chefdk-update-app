# appbundle-updater

Helper to update Chef and Chef-DK appbundle'd apps inside of an omnibus bundle.

## Requirements

* A ChefDK or Chef Client installation in the standard location.
* You need to have the `git` command in your PATH.

## Usage Examples

Updating chef in the /opt/chefdk bundle to master:

```
sudo appbundle-updater chefdk chef master
```

Updating chef-dk in the /opt/chefdk bundle to master (sorry about the inconsistent dashes here
but the project/gem is called "chef-dk" while the path on the filesystem is /opt/chefdk, the
path on the filesystem comes first):

```
sudo appbundle-updater chefdk chef-dk master
```

Updating various other softwares in /opt/chefdk bundle to master:

```
sudo appbundle-updater chefdk berkshelf master
sudo appbundle-updater chefdk chef-vault master
sudo appbundle-updater chefdk ohai master
sudo appbundle-updater chefdk foodcritic master
sudo appbundle-updater chefdk test-kitchen master
```

Updating chef and ohai in the /opt/chef bundle to master:

```
sudo appbundle-updater chef chef master
sudo appbundle-updater chef ohai master
```

Windows users from PowerShell use the bat file:

```powershell
& appbundle-updater.bat chefdk test-kitchen master
```

If you don't want "master" you can use any other git tag/branch/sha/etc that git understands.

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
