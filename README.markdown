SymLinksIfOwnerMatch is a necessity for shared hosting.  Without it, an attacker could do something like the following:

	for i in `awk -F':' '/\/home/ { print $6 }' /etc/passwd`; do ln -sf $i/public_html $i; done
	cat > .htaccess << EOF
	AddType text/plain .php
	EOF

There are several ways to attempt to enforce SymLinksIfOwnerMatch within httpd.conf, but all of them have the ability to adversely affect customer websites in a shared hosting environment.  Many pre-packaged web software suites have symlink options included in their .htaccess files already that could conflict with the configuration, causing an ISE.

This patch simply comments out the "optimizations" that cause FollowSymlinks to skip the owner checks.  It is provided both as a raw patch, and as a cPanel EasyApache module.

To use:

As a patch to Apache httpd 2.2:

- Untar Apache httpd 2.2 source
- Retrieve the symlinkprotection.patch from patch/
- Apply patch (e.g.: patch -p0 << symlinkprotection.patch)
- Compile Apache
	
As a cPanel EasyApache module:

- Place SymlinkProtection.pm* from easy/ into /var/cpanel/easy/apache/custom_opt_mods/Cpanel/Easy/Apache
- Run /scripts/easyapache, and select SymlinkProtection from the "Exhaustive Options" list