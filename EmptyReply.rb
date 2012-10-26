# -*- coding: utf-8 -*-
# 空リプ

Plugin.create(:EmptyReply) do
    command(:EmptyReply,
            name: 'こいつに空リプ',
            condition: Plugin::Command[:CanReplyAll],
            visible: true,
            role: :timeline) do |m|
    m.messages.map do |msg|
      str = "@#{msg.message.user.idname} "
      Post.primary_service.update(:message => str,
                                  :replyto => msg.message)
    end
  end
end
