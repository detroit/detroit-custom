module Detroit

  # Custom tool is used to create "quicky" services.
  #
  # This is a useful alternative to writing a full-blown plugin
  # when the need is simple.
  #
  class Custom < Tool

    # Default group(s) in which this plugin operates.
    #DEFAULT_TRACK = "main"

    # Which group(s) to run this custom plugin.
    #attr_accessor :group

    # Special writer to allow single group or a list of groups.
    #def group=(val)
    #  @group = val.to_list #[val].flatten
    #end

    # Plural alias for #group.
    #alias_accessor :groups, :group

    SPECIAL_OPTIONS = %w{
      tool class track active priority project 
      trial trace verbose force quiet
    }

    # Instantiate new custom plugin.
    #
    # This works by interpreting the service configuration as a hash of
    # stop names to ruby code.
    #
    def initialize(options)
      super(options)

      @scripts = {}

      options.each do |stop, script|
        # skip specific names used for configuration
        next if SPECIAL_OPTIONS.include? stop
        # remaining options are names of group stops
        @scripts[stop.to_sym] = script
      end
    end

    #
    def assemble?(stop, info={})
      @scripts.key?(stop)
    end

    #
    def assemble(stop, info={})
      instance_eval(@scripts[stop])
    end

  private

    # Set initial attribute defaults.
    #def initialize_defaults
    #  #@group = [DEFAULT_GROUP]
    #end

    #
    def method_missing(s, *a, &b)
      if s.to_s.end_with?('=')
      #  stop = s.to_s.chomp('=')
      #  if !SPECIAL_OPTIONS.include?(stop)
      #   (class << self; self; end).module_eval %{
      #      def station_#{stop}
      #        #{a.first}
      #      end
      #    }
      #  end
      else
        if @context.respond_to?(s)
          @context.__send__(s,*a,&b)
        else
          super(s, *a, &b)
        end
      end
    end

    # @todo should only respond to stop names and special options.
    #def respond_to?(s)
    #  return true if SPECIAL_OPTIONS.include?(s.to_s)
    #  return true
    #end

    # RUBY 1.9
    def respond_to_missing?(name, privy)
      #return true if name.to_s.start_with?('station_')
      return true if name.to_s.end_with?('=')
      return true if @context.respond_to?(name)
      false
    end

    #def inspect
    #  "#<Custom>"
    #end

  end

  # The CustomTool does not belong to a specific assembly.
  register_tool(Custom)

end
