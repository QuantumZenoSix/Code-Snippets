
# PerlCompile

[perlcompile_cpan](https://metacpan.org/dist/B-C/view/perlcompile.pod)  
```bash
sudo apt-get install libperl-dev  
```

<br />

__Compile__
```bash
perlcc -o hello hello.pl  # Compiles into executable 'hello'
```

<br />

# pp

[pp_cpan](https://metacpan.org/pod/pp)

requires 
- Archive::Zip
- ScanDeps
- PAR
- Getopt::ArgvFile 

```bash
perl -MCPAN -e shell
install Archive::Zip
install Module::ScanDeps
install PAR
install Getopt::ArgvFile
```

<br />

__Compile__
```bash
pp -M PAR -M Data::Dumper -x -o hello hello.pl
```
