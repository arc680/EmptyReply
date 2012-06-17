# -*- coding: utf-8 -*-
# 空リプ

Module.new do
  Plugin.create(:EmptyReply).add_event_filter(:command){ |menu|
    menu[:EmptyReply] = {
      :slug => :EmptyReply,
      :name => 'こいつに空リプ',
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m|
        Post.primary_service.update(:message=> "@#{m.message.user.idname}",
                                    :replyto => m.message)
         },
      :visible => true,
      :role => :message }
    [menu]
  }
end
