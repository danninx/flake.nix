{ ... }:

{
  programs.plasma.kscreenlocker = {
    autoLock = true;
    lockOnResume = true;
    lockOnStartup = true;
    timeout = 5;
  };
}
