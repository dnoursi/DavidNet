module Paths_david_site (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/david/DavidNet/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/bin"
libdir     = "/home/david/DavidNet/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/lib/x86_64-linux-ghc-7.10.3/david-site-0.1.0.0-27HuweA6gHZG6a0FiEXY0o"
datadir    = "/home/david/DavidNet/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/share/x86_64-linux-ghc-7.10.3/david-site-0.1.0.0"
libexecdir = "/home/david/DavidNet/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/libexec"
sysconfdir = "/home/david/DavidNet/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "david_site_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "david_site_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "david_site_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "david_site_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "david_site_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
