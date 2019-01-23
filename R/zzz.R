.onLoad <- function(libname, pkgname) {
  os <- Sys.info()['sysname']
  if (os == "Linux") {
    url <- "http://www.uoguelph.ca/~hydrogeo/WhiteboxTools/WhiteboxTools_linux_amd64.tar.xz"
  } else if (os == 'Windows') {
    url <- "http://www.uoguelph.ca/~hydrogeo/WhiteboxTools/WhiteboxTools_win_amd64.zip"
  } else if (os == "Darwin") {
    url <- "http://www.uoguelph.ca/~hydrogeo/WhiteboxTools/WhiteboxTools_linux_amd64.tar.xz"
  } else {
    print("Unsupported operating system")
    url <- "http://www.uoguelph.ca/~hydrogeo/WhiteboxTools/WhiteboxTools_linux_amd64.tar.xz"
  }

  pkg_dir <- find.package("whitebox")
  filename <- basename(url)
  print("Downloading WhiteboxTools executable ...")
  exe_zip <- file.path(pkg_dir, filename)

  if(!file.exists(exe_zip)) {
    utils::download.file(url = url, destfile = exe_zip)
  }

  print(paste("Decompressing", filename, "..."))
  if(file.exists(exe_zip) & os == "Windows") {
    utils::unzip(exe_zip, exdir = pkg_dir)
  } else {
    utils::untar(exe_zip, exdir = pkg_dir)
  }

  print(paste("WhiteboxTools executable is located at:", file.path(pkg_dir, "WBT")))
  print("Installation completed!")
}