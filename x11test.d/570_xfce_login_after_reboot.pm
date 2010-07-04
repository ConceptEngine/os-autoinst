use base "basetest";
use bmwqemu;

sub is_applicable()
{
	return $ENV{DESKTOP} eq "xfce";
}

sub run()
{
	my $self=shift;
	my $ok=waitinststage "xdm-loginscreen", 80;
	if($ok) {
		waitidle;

		# log in
		sendautotype $username."\n";
		sleep 1;
		sendautotype $password."\n";
		waitinststage "XFCE", 40;
		sleep 5;
	}
}

sub checklist()
{
	# return hashref:
	return {qw(
	)}
}

1;
