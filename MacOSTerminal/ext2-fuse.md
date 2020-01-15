## Manual installation of ext2-fuse on MacOS

MacPort is installed in non-root. I can install library but not the Fuse part.

### 1. Install OSXFuse
Using the official package from https://osxfuse.github.io

### 2. Install dependencies with Macports:
```
port install m4 autoconf automake libtool e2fsprogs
```

### 3. Clone source
```
git clone https://github.com/alperakcan/fuse-ext2.git	
```

### 4. Clear file attributes
This trick fixes the issue `Code Sign Error - resource fork, Finder information, or similar detritus not allowed` ([reference](https://stackoverflow.com/questions/39652867/code-sign-error-in-macos-high-sierra-xcode-resource-fork-finder-information))
```
xattr -cr fuse-ext2
```

### 5. Compile
Replacing MYUSERNAME by your own username 
```
cd fuse-ext2
./autogen.sh
CFLAGS="-idirafter/Users/MYUSERNAME/macports/include/ -idirafter/usr/local/include/osxfuse" LDFLAGS="-L/Users/MYUSERNAME/macports/lib -L/usr/lib" ./configure
make
```

### 6. Compile
The only step you need to execute as root:
```
sudo make install
```

### 7. Compile
Test it!
```
cd ~
mkdir mnt
sudo fuse-ext2 /dev/disk3s2 mnt
ls mnt
```
