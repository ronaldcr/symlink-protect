package Cpanel::Easy::Apache::SymlinkProtection;

our $easyconfig = {
	'name' => 'SymlinkProtection patch',
	'version' => '$Rev: 1 $',
	'hastargz' => 1,
	'url' => '',
	'step' => {
		'0' => {
			'name' => 'Applying SymlinkProtection patch',
			'command' => sub {
				my ($self) = @_;
				return $self->apply_patch('symlinkprotection.patch');
			}
		}
	}
};

1;
