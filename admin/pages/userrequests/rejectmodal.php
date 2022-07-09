<div class="fixed left-0 right-0 z-50 items-center justify-center hidden overflow-x-hidden overflow-y-auto bg-gray-900/50 top-4 md:inset-0 h-modal sm:h-full" id="rejectmodal" aria-modal="true" role="dialog">
  <div class="relative w-full h-full max-w-md px-4 md:h-auto">
    <div class="relative bg-white rounded-lg shadow">
      <div class="flex justify-end p-2">
        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-close-button>
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
          </svg>
        </button>
      </div>
      <div class="p-6 pt-0 text-center">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-20 h-20 mx-auto text-red-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
        <h3 class="mt-5 mb-6 text-xl font-normal text-gray-500">Are you sure you want to reject this request?</h3>
        <form action="../includes/userrequests.inc.php" method="post">
          <?php if (isset($_GET['status'])) { ?>
            <input type="hidden" name="status" value="<?= $_GET['status']; ?>" readonly>
          <?php } ?>
          <input id="id" type="hidden" name="id" readonly>
          <input id="userid" type="hidden" name="userid" readonly>
          <input id="cipoints" type="hidden" name="cipoints" readonly>
          <input id="year" type="hidden" name="year" readonly>
          <input id="semester" type="hidden" name="semester" readonly>
          <button type="submit" name="reject" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-base inline-flex items-center px-3 py-2.5 text-center mr-2">
            Yes, I'm sure
          </button>
          <button type="button" class="text-gray-900 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 border border-gray-200 font-medium inline-flex items-center rounded-lg text-base px-3 py-2.5 text-center" data-close-button>
            No, cancel
          </button>
        </form>
      </div>
    </div>
  </div>
</div>