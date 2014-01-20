include_recipe "build-essential"

package "libelf-dev"
package "gcc-avr"
package "avr-libc"
package "freeglut3"
package "freeglut3-dev"
package "avrdude"
package "picocom"
package "git"

magic_shell_environment 'SIMAVR_UART_XTERM' do
  value '1'
end
