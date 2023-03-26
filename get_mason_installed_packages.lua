local packages = require('mason-registry').get_installed_package_names()
table.sort(packages)

for _, package in pairs(packages) do print(package) end
