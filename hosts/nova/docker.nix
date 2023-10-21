{...}: {
  virtualisation.oci-containers.containers = {
    plex = {
      ports = [
        "32400:32400"
      ];
      image = "plexinc/pms-docker";
      environment = {
        TZ = "America/New_York";
      };
      volumes = [
        "/media/plex:/media:ro"
        "/media/plex/config:/config"
      ];
    };
  };
}
