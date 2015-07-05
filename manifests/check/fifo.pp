define monit::check::fifo(
  # Common parameters.
  $ensure     = present,
  $group      = $name,
  $alerts     = [],
  $noalerts   = [],
  $tests      = [],
  $depends    = [],
  $priority   = '20',
  $bundle     = $name,
  $order      = 0,

  # Check type specific.
  $template   = 'monit/check/fifo.erb',
  $path
) {
  validate_absolute_path($path)

  monit::check::instance { "${name}_instance":
    name     => $name,
    ensure   => $ensure,
    type     => 'fifo',
    priority => $priority,
    bundle   => $bundle,
    order    => $order,
    template => $template,
    tests    => $tests,
  }
}

