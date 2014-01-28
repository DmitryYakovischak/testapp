Users = function() {};

jQuery(function() {
  Users.sortable = function() {
    $("#sort_users").sortable({
      axis: 'y',
      handle: '.handle',
      update: function() {
        return $.post($(this).data('update-url'), $(this).sortable('serialize'));
      }
    });
  };
  return Users.sortable();
});